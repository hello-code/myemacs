;;; init-pomidor.el --- pomodoro
;;; https://github.com/TatriX/pomidor
;;; Commentary:
;;; Code:

(use-package pomidor
  :ensure t
  :config
  (global-set-key "\M-p" #'pomidor)

  (setq alert-default-style 'libnotify)
  
  ;; (setq-default mode-line-format
  ;;              (cons mode-line-format '(pomodoro-mode-line-string)))
  )
(provide 'init-pomidor)
;;; init-pomodoro.el ends here
