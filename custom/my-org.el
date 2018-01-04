;;; my-org.el --- custom org configuration
;;; Commentary:
;;; Code:

(require 'org)
(require 'org-capture)
(require 'org-agenda)
(require 'appt)

;; Agenda setup
(setq org-agenda-files (list
                        "~/org"
                        "~/org/share"
                        ;; "~/org/local/"
                        ;; "~/org/sync/"
                        ))

(global-set-key (kbd "<f7>") 'org-capture)
(global-set-key (kbd "<f8>") 'org-agenda)

;; TODO keyword
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s!)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("STARTED" :foreground "#ffff99" :weight bold)
              ("NEXT" :foreground "cyan" :weight bold)
              ("DONE" :foreground "chartreuse3" :weight bold)
              ("WAITING" :foreground "yellow" :weight bold)
              ("HOLD" :foreground "orange" :weight bold)
              ("CANCELLED" :foreground "gray" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold))))

;; fast TODO selection
(setq org-use-fast-tag-selection t)
;; allows changing TODO states with S-left/right
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; TODO state triggers
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD") ("INBOX"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; Capture templates
(setq org-capture-templates
      (quote (
              ("s" "Study & Learn")
              ("sr" "Reading" entry(file+headline "~/org/refile.org" "Reading")
               "* TODO %? :READING:\n%U\n")

              ("i" "Inbox" entry (file+headline "~/org/refile.org" "Inbox")
               "* %? :INBOX:\n%U\n%a\n" :clock-in t :clock-resume t)
              
              ("r" "respond" entry (file "~/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/org/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/org/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("m" "Meeting" entry (file "~/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;;; clock
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persistence-insinuate t)
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook #'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook #'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook #'sanityinc/hide-org-clock-from-header-line)

;; 只在org模式中绑定该快捷键
(define-key org-mode-map (kbd "C-c i") 'org-clock-in);开始时间
(define-key org-mode-map (kbd "C-c o") 'org-clock-out);结束时间

;;; refile
;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Refile settings
;; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

;; 保存时“格式化”文件内容
(add-hook 'before-save-hook '(lambda()
                               (when (eq major-mode 'org-mode)
                                 (indent-region (point-min)(point-max)))))

;;; auto rebuild agenda buffer
;; http://emacs.stackexchange.com/questions/16326/how-to-rebuild-agenda-buffers-when-saving-an-org-mode-buffer
(defun my-redo-all-agenda-buffers ()
  "Rebuild agenda buffer."
  (interactive)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'org-agenda-mode)
        (org-agenda-maybe-redo)))))

(add-hook 'org-after-todo-state-change-hook 'my-redo-all-agenda-buffers)

;; For org appointment reminders

;; (defadvice  org-agenda-redo (after org-agenda-redo-add-appts)
;;   "Pressing `r' on the agenda will also add appointments."
;;   (progn
;;     (setq appt-time-msg-list nil)
;;     (org-agenda-to-appt)))

;; (ad-activate 'org-agenda-redo)

;;(add-hook 'after-save-hook 'org-agenda-to-appt)
;; Hook run just before displaying an agenda buffer.
;;(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt

(add-hook 'org-agenda-mode-hook 'org-agenda-to-appt)

(setq
 appt-message-warning-time 2  ;提前2分钟提醒
 appt-display-interval 1      ;每过1分钟提醒一次
 ;;appt-display-duration 20   ;这里已经被notify-send接管了，所以此处持续时间无效。
 appt-display-mode-line t     ;; show in the modeline
 appt-display-format 'window) ;; use our func

(appt-activate 1)             ;; active appt (appointment notification)
(display-time)                ;; time display is required for this...

;; 提醒
(defun djcb-popup (title msg &optional icon sound)
  "Show a popup if we're on X,or echo it otherwise.
TITLE is the title of the message,
MSG is the context.
Optionally, you can provide an ICON and a SOUND to be played."
  (interactive)
  (if (eq window-system 'x)
      (shell-command (concat "notify-send "
                             (if icon (concat "-i " icon) "")
                             " '" title "' '" msg "' -t 30000"));持续显示30秒
    (message (concat title ": " msg)))
  (when sound (shell-command (concat "mplayer -really-quiet " sound " 2> /dev/null")))
  ;;(when sound (play-sound-file sound))
  )

;; our little façade-function for djcb-popup
(defun djcb-appt-display (min-to-app new-time msg)
  "Display pop window's icon and sound.
MIN-TO-APP: minutes,NEW-TIME:new time,MSG:message"
  (djcb-popup (format "Appointment in %s minute(s)" min-to-app) msg
              ;; display pop window
              "~/myemacs/resource/info_org.png"
              "~/myemacs/resource/ring.wav"))

(setq appt-disp-window-function (function djcb-appt-display))

;; overwrite built-in function
;;(proviError running timer appt-delete-window':
;;    (error "No buffer named *appt-buf*")de 'init-org)
(defun appt-delete-window () "Nothing.Overwrite built-in function." )

;; org-level headers font size
(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0))
  ;; use english language
  (set-locale-environment "English")
  )

(add-hook 'org-mode-hook 'my/org-mode-hook)

;; Habit tracing
;; 1. customize-variables RET org-modules RET habit
(setq org-habit-graph-column 60)
;;(setq org-habit-show-habits-only-for-today nil)

;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;;; Custom agenda views
(setq org-agenda-custom-commands
      '(
        ("u" agenda "Unfinished Tasks"
         ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
          (org-agenda-sorting-strategy '(priority-down))
          ;;(org-agenda-prefix-format "  Mixed: ")
          ))
        ("i" "Inbox" tags "INBOX"
         ((org-agenda-overriding-header "There are something in box")
          (org-tags-match-list-sublevels nil)))
        ))

(provide 'my-org)
;;; my-org ends here
