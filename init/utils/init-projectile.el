;;; init-projectile -- projectile
;;; Commentary:
;;; Code:

(use-package projectile
  :ensure t
  :defer 1
  :init
  (setq projectile-mode-line
        '(:eval (list "Pj:"
                      (propertize (projectile-project-name) 'face '(:background "#d98f22" :foreground "black"))
                      "")))
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1))

(provide 'init-projectile)
;;; init-projectile.el ends here
