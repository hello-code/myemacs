;;; init-imenu-list --- imenu-list
;;; Commentary:
;;; Code:

(use-package imenu-list
  :ensure t
  :bind("C-m" . #'imenu-list-smart-toggle)
  :config
  (setq imenu-list-focus-after-activation t)
  (setq imenu-list-auto-resize t)
  )

(provide 'init-imenu-list)
;;; init-imenu-list.el ends here
