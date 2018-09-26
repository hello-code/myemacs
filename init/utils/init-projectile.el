;;; init-projectile -- projectile
;;; Commentary:
;;; https://github.com/bbatsov/projectile
;;; https://projectile.readthedocs.io/en/latest/installation/
;;; Code:

(use-package projectile
  :defer t
  :ensure t
  :config
  ;; (setq projectile-mode-line
  ;;       '(:eval (list " Pj:"
  ;;                     (propertize (projectile-project-name) 'face '(:background "#d98f22" :foreground "black"))
  ;;                     "")))

  (setq projectile-mode-line-lighter " Proj")
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))
(provide 'init-projectile)
;;; init-projectile.el ends here
