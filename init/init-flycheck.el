;;; init-flycheck.el --- flycheck
;;; Commentary:
;;; Code:

;;; Flycheck does not use load-path when checking Emacs Lisp files. Instead,
;;; it uses flycheck-emacs-lisp-load-path, which is empty by default.
(setq-default flycheck-emacs-lisp-load-path 'inherit)
;;(setq-default flycheck-emacs-lisp-initialize-packages 'auto)

(defvar flycheck-packages
  '(
    flycheck
    flycheck-pos-tip
    flycheck-color-mode-line
    ))

(my-install-packages flycheck-packages)

(add-hook 'after-init-hook 'global-flycheck-mode)

(with-eval-after-load "flycheck"
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
