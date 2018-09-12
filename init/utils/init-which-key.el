;;; init-which-key.el --- which-key
;;; Commentary:
;;; https://github.com/justbur/emacs-which-key#initial-setup
;;; Code:

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init (progn
	      (setq which-key-idle-delay 0.05)
	      (setq which-key-enable-extended-define-key t)
	      )
  :config(progn
	       (which-key-mode t)
	       ))

(provide 'init-which-key)
;;; init-which-key ends here
