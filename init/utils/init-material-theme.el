;;; init-material-theme.el --- material theme
;;; Commentary:
;;; https://github.com/cpaulik/emacs-material-theme
;;; Code:

(require-package 'material-theme)

(load-theme 'material t)
;;(set-face-attribute 'fringe nil :background "black")

(custom-set-faces
 '(linum ((t (:background "black" :foreground "#a7adba"))))
 )

(provide 'init-material-theme)
;;; init-material-theme ends here
