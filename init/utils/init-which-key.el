;;; init-which-key.el --- which-key
;;; Commentary:
;;; https://github.com/justbur/emacs-which-key#initial-setup
;;; Code:

(use-package which-key
  :ensure t
  :defer nil
  :diminish which-key-mode
  :init (progn
	      (setq which-key-idle-delay 0.05)
	      (setq which-key-enable-extended-define-key t)
	      )
  :config
  (which-key-mode))

(provide 'init-which-key)
;;; init-which-key ends here
