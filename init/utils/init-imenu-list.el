;;; init-imenu-list --- imenu-list
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'imenu-list)
  (package-refresh-contents)
  (package-install 'imenu-list))

(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)

(with-eval-after-load "imenu-list"
  (setq imenu-list-focus-after-activation t)
  (setq imenu-list-auto-resize t))

(provide 'init-imenu-list)
;;; init-imenu-list.el ends here
