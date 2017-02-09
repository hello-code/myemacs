;;; init-flycheck.el --- flycheck
;;; Commentary:
;;; Code:

(global-flycheck-mode)

;; ;; Flycheck does not use load-path when checking Emacs Lisp files. Instead, it uses flycheck-emacs-lisp-load-path, which is empty by default.
(setq-default flycheck-emacs-lisp-load-path 'inherit)

(setq-default flycheck-emacs-lisp-initialize-packages t)


(provide 'init-flycheck)
;;; init-flycheck.el ends here
