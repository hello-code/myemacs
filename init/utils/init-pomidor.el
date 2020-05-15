;;; init-pomidor.el --- pomidor
;;; https://github.com/TatriX/pomidor
;;; Commentary:
;;; Code:

(use-package pomidor
  :ensure t
  :defer t
  :init
  (global-set-key "\M-p" #'pomidor)
  :config
  (setq
   ;;pomidor-sound-tick nil ;; nil取消声音
   ;;pomidor-sound-tack nil ;; nil取消声音
   ;;(setq pomidor-seconds (* 25 60)) ;; 25 minutes
   ;;(setq pomidor-break-seconds (* 5 60)) ;; 5 minutes
   pomidor-sound-tick (expand-file-name (concat (getenv "HOME") "/myemacs/resource/tick.wav"))
   pomidor-sound-tack (expand-file-name (concat (getenv "HOME") "/myemacs/resource/tack.wav"))
   pomidor-sound-overwork (expand-file-name (concat (getenv "HOME") "/myemacs/resource/ring.wav"))
   pomidor-sound-break-over (expand-file-name (concat (getenv "HOME") "/myemacs/resource/rest.wav"))
   )
  (progn
    (set-face-attribute 'pomidor-work-face nil :foreground "#6495ed")
    (set-face-attribute 'pomidor-overwork-face nil :foreground "#ff4040")
    (set-face-attribute 'pomidor-break-face nil :foreground "#00ff00")
    (set-face-attribute 'pomidor-skip-face nil :foreground "#eeeed1"))
  ;; log
  ;; https://github.com/TatriX/pomidor/issues/20
  (defadvice pomidor-stop (before pomidor-save-log activate)
    "Log pomidor data to the ~/pomidor-log.csv file.
     Columns: date,work,overwork,break"
    (write-region (format "%s,%d,%d,%d\n"
                          (format-time-string "%F %T")
                          (/ (time-to-seconds (pomidor-work-duration)) 60)
                          (/ (time-to-seconds (or (pomidor-overwork-duration) 0)) 60)
                          (/ (time-to-seconds (or (pomidor-break-duration) 0)) 60))
                  nil
                  "~/pomidor-log.csv"
                  'append))

  ;; change default notification style
  ;; ===================
  ;; growl
  ;; ==================================================================
  (require 'cl)
  (defun alert-growl-notify (info)
    (if alert-growl-command
        (let* ((title (alert-encode-string (plist-get info :title)))
               (priority (number-to-string
                          (cdr (assq (plist-get info :severity)
                                     alert-growl-priorities))))
               (args
                (case system-type
                      ('windows-nt (mapcar
                                    (lambda (lst) (apply #'concat lst))
                                    `(
                                      ;; http://www.growlforwindows.com/gfw/help/growlnotify.aspx
                                      ("/i:" ,(file-truename (concat invocation-directory "../share/icons/hicolor/48x48/apps/emacs.png")))
                                      ("/t:" ,title)
                                      ("/p:" ,priority))))
                      (t (list
                          "--appIcon"  "Emacs"
                          "--name"     "Emacs"
                          "--title"    title
                          "--priority" priority)))))
          (if (and (plist-get info :persistent)
                   (not (plist-get info :never-persist)))
              (case system-type
                    ('windows-nt (nconc args (list "/s:true")))
                    (t (nconc args (list "--sticky")))))
          (let ((message (alert-encode-string (plist-get info :message))))
            (case system-type
                  ('windows-nt (nconc args (list message)))
                  (t (nconc args (list "--message" message)))))
          (apply #'call-process alert-growl-command nil nil nil args))
      (alert-message-notify info)))

  (alert-define-style 'growl :title "Notify using Growl"
                      :notifier #'alert-growl-notify)
  ;; ==================================================================
  
  (cond
   ((eq system-type 'windows-nt)
    (defun windows-version()
      (let ((ver (shell-command-to-string "ver")))
        (string-match "[[:digit:]].[[:digit:]]" ver)
        (match-string 0 ver)
        ))
    (if (equal "6.1" (windows-version))
        (setq alert-default-style 'growl) ;; Windows 7
      (setq alert-default-style 'toaster) ;; Windows 10
      ))
   ((eq system-type 'gnu/linux)
    (setq alert-default-style 'libnotify)
    ))
  )
(provide 'init-pomidor)
;;; init-pomidor.el ends here
