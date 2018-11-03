;;; init-flycheck.el --- flycheck
;;; Commentary:
;;; https://github.com/flycheck/flycheck-color-mode-line
;;; https://github.com/flycheck/flycheck-pos-tip
;;; Code:

(use-package flycheck
  :defer t
  :ensure t
  ;; :init (global-flycheck-mode)
  :config
  ;; Flycheck does not use load-path when checking Emacs Lisp files. Instead,
  ;; it uses flycheck-emacs-lisp-load-path, which is empty by default.
  (setq-default flycheck-emacs-lisp-load-path 'inherit)

  (setq-default flycheck-highlighting-mode 'lines)
  ;; Define fringe indicator / warning levels
  (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
    (vector #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00011100
            #b00111110
            #b00111110
            #b00111110
            #b00011100
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000))
  (flycheck-define-error-level 'error
    :severity 2
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-error)
  (flycheck-define-error-level 'warning
    :severity 1
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-warning)
  (flycheck-define-error-level 'info
    :severity 0
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-info)

  (setq flycheck-display-errors-function nil) ;; disable error reporting in the mini buffer.
  )

(use-package flycheck-pos-tip
  :after flycheck
  :ensure t
  :config (setq flycheck-pos-tip-timeout 10))

(use-package flycheck-color-mode-line
  :after flycheck
  :ensure t)

(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
