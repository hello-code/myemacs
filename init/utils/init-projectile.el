;;; init-projectile -- projectile
;;; Commentary:
;;; https://github.com/bbatsov/projectile
;;; https://projectile.readthedocs.io/en/latest/installation/
;;; Code:

(use-package projectile
  ;; :defer t
  :ensure t
  :config
  (setq projectile-mode-line-function '(lambda () (format " Proj[%s]" (projectile-project-name))))
  ;;(setq projectile-mode-line-lighter " Pj")
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(provide 'init-projectile)
;;; init-projectile.el ends here
