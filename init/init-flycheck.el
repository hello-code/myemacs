;;; init-flycheck.el --- flycheck
;;; Commentary:
;;; https://github.com/flycheck/flycheck-color-mode-line
;;; https://github.com/flycheck/flycheck-pos-tip
;;; Code:

(use-package flycheck
  :defer 2
  :ensure t
  :config
  (global-flycheck-mode)
  ;; Flycheck does not use load-path when checking Emacs Lisp files. Instead,
  ;; it uses flycheck-emacs-lisp-load-path, which is empty by default.
  (setq-default flycheck-emacs-lisp-load-path 'inherit)
  )

(use-package flycheck-pos-tip
  :defer 2
  :after flycheck
  :ensure t
  :config (setq flycheck-pos-tip-timeout 10))

(use-package flycheck-color-mode-line
  :defer 2
  :after flycheck
  :ensure t
  )

(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
