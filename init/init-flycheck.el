;;; init-flycheck.el --- flycheck
;;; Commentary:
;;; Code:

;; ;; Flycheck does not use load-path when checking Emacs Lisp files. Instead, it uses flycheck-emacs-lisp-load-path, which is empty by default.
;; (setq-default flycheck-emacs-lisp-load-path 'inherit)

;;  (setq-default flycheck-emacs-lisp-initialize-packages t)


(defvar flycheck-packages 
  '(
    flycheck
    flycheck-pos-tip
))

;; fetch the list of packages available
(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package flycheck-packages)
  (unless (package-installed-p package)
    (package-install package)))


(add-hook 'after-init-hook 'global-flycheck-mode)
(with-eval-after-load 'flycheck
   (flycheck-pos-tip-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
