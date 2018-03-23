;;; init-javascript --- javascript
;;; Commentary:
;;; npm install typescript

;;; Code:

;; list packages for javascript
(defvar js-packages
  '(
    js2-mode
    tide
    )
  )

;; fetch the list of packages available
(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package js-packages)
  (unless (package-installed-p package)
    (package-install package)))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(with-eval-after-load 'js2-mode
  (add-hook 'js2-mode-hook #'setup-tide-mode)
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  ;; configure javascript-tide checker to run after your default javascript checker
  ;(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  )

(provide 'init-javascript)
;;; init-javascript.el ends here
