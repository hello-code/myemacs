;;; init-theme.el --- theme
;;; Commentary:
;;; Code:

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-night t)
  ;; (set-face-attribute 'region nil :background "#666" :foreground "#ffffff")
  )

(provide 'init-theme)
;;; init-theme ends here
