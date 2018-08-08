;;; init-flycheck.el --- flycheck
;;; Commentary:
;;; https://github.com/flycheck/flycheck-color-mode-line
;;; https://github.com/flycheck/flycheck-pos-tip
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

;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;(require 'flycheck-color-mode-line)

;; (with-eval-after-load "flycheck"
;;   '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(custom-set-faces
 ;;'(linum-highlight-face ((t (:background "#37474f" :foreground "orange" :weight bold))))
 )

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
