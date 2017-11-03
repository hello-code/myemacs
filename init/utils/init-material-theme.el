;;; init-material-theme.el --- material theme
;;; Commentary:
;;; https://github.com/cpaulik/emacs-material-theme
;;; Code:

(require 'package)

(unless (package-installed-p 'material-theme)
  (package-refresh-contents)
  (package-install 'material-theme)
  )

(load-theme 'material t)

(provide 'init-material-theme)
;;; init-material-theme ends here
