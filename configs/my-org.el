;;; my-org.el --- custom org configuration
;;; Code:

(global-set-key (kbd "<f8>") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
;; Agenda
(setq org-agenda-window-setup 'current-window)
(setq org-agenda-files (list "~/org/local/"
                             "~/org/sync/"
                             ))
;; mobileOrg
(require 'org-mobile)
(setq org-mobile-directory "~/org/morg/")
;; 默认情况下它的值跟变量org-agenda-files的值一样的
(setq org-mobile-files(list "~/org/sync/todolist.org"
                            "~/org/sync/notebook.org"))
;;org-mode中换行
;;(setq org-startup-truncated nil)

;;模板
 (setq org-capture-templates
		'(
		  ("i" "Local Inbox" entry (file+headline "~/org/local/gtd.org" "Inbox")
		   ;;"* TODO %?\n  Added: %U\n  From: %a\n" :empty-lines 1)
		   "* TODO %^{prompt|%a} %?\n  Added: %U\n  From: %a\n" :empty-lines 1)

		  ("t" "Local Task" entry (file+headline "~/org/local/gtd.org" "Task")
		   ;;"** TODO %?\n   Added: %U\n   From: %a\n" :empty-lines 1)
		   "** TODO %^{prompt|%a|%x} %?\n   SCHEDULED: %t\n   Added: %U\n   From: %^{From|%a|%x}\n"
		   :empty-lines 1)

		  ("s" "Ideas" entry (file+headline "~/org/local/gtd.org" "Ideas")
		   "* %?\n  Added: %U" :empty-lines 1)
		  
		  ("j" "Journal" entry (file+datetree "~/org/local/journal.org")
		   ;;"* %?\n%U\n" :clock-in t :clock-resume t
		   "* %<%T> %?" :empty-lines 1)
		  
		  ("l" "Log Time" entry (file+datetree "~/org/local/timelog.org")
		   "** [%<%Y-%m-%d %H:%M:%S>] - %^{Brief Description} :TIME:"
		   :clock-in t :clock-resume t :empty-lines 1)

		  ("n" "Notebook" entry (file+datetree "~/org/sync/notebook.org")
		   ;;"** %U - %^{Activity}")
		   "** %^{prompt|%x}\n   Added:%U\n   %?" :empty-lines 1)
		  
		  ("I" "Sync Inbox" entry (file+headline "~/org/sync/todolist.org" "Inbox")
		   "* TODO %^{prompt|%a} %?\n  Added: %U\n  From: %a\n" :empty-lines 1)

		  ("T" "Sync Task" entry (file+headline"~/org/sync/todolist.org" "Task")
		   "** TODO %^{prompt|%a|%x} %?\n   SCHEDULED: %t\n   Added: %U\n   From: %^{From|%a|%x}\n"
		   :empty-lines 1)
		  )
		)


;; 大纲视图缩进
;;(setq org-startup-indented t)

;; 切换任务状态
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)"))))

;; 提醒
(defun djcb-popup (title msg &optional icon sound)
  "Show a popup if we're on X,or echo it otherwise.
TITLE is the title of the message,
MSG is the context.
Optionally, you can provide an ICON and a SOUND to be played."

  (interactive)
  (if (eq window-system 'x)
      (shell-command (concat
                      "notify-send "
                      (if icon (concat "-i " icon) "")
                      " '" title "' '" msg "' -t 30000"));持续显示30秒
    (message (concat title ": " msg)))
  (when sound (shell-command
               (concat "mplayer -really-quiet " sound " 2> /dev/null")))
                                        ;(when sound (play-sound-file sound))
  )

;; the appointment notification facility
(require 'appt)
(setq appt-message-warning-time 2;提前2分钟提醒
      appt-display-interval 1;每过1分钟提醒一次
      ;;appt-display-duration 20; 这里已经被notify-send接管了，所以此处持续时间无效。
      appt-display-mode-line t     ;; show in the modeline
      appt-display-format 'window) ;; use our func

(appt-activate 1)              ;; active appt (appointment notification)
(display-time)                 ;; time display is required for this...

;; update appt each time agenda opened
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)

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
(defun appt-delete-window ()
  "Nothing.Overwrite built-in function."
  )

;;; auto rebuild agenda buffer
;; http://emacs.stackexchange.com/questions/16326/how-to-rebuild-agenda-buffers-when-saving-an-org-mode-buffer
(defun my-redo-all-agenda-buffers ()
  "Rebuild agenda buffer."
  (interactive)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'org-agenda-mode)
        (org-agenda-redo t)))))

(add-hook 'org-after-todo-state-change-hook 'my-redo-all-agenda-buffers)
;; 记录工作时间（花在某个任务上的时间）
;; 只在org模式中绑定该快捷键
(define-key org-mode-map (kbd "C-c i") 'org-clock-in);开始时间
(define-key org-mode-map (kbd "C-c o") 'org-clock-out);结束时间
(define-key org-mode-map (kbd "C-c ;") 'org-time-stamp-inactive);插入不活跃的时间戳

(setq org-log-into-drawer nil)
(setq org-clock-into-drawer nil)

(provide 'my-org)
;;; my-org ends here
