;;; init-neotree --- side bar
;;; Commentary:
;;; Code:

(use-package neotree
  :defer t
  :ensure t
  :config
  ;; (defun neotree-project-dir-toggle ()
  ;;   "Open NeoTree using the project root."
  ;;   (interactive)
  ;;   (let ((project-dir
  ;;          (ignore-errors
  ;;            (projectile-project-root)
  ;;            ))
  ;;         (file-name (buffer-file-name))
  ;;         (neo-smart-open t))
  ;;     (if (and (fboundp 'neo-global--window-exists-p)
  ;;              (neo-global--window-exists-p))
  ;;         (neotree-hide)
  ;;       (progn
  ;;         (neotree-show)
  ;;         (if project-dir
  ;;             (neotree-dir project-dir))
  ;;         (if file-name
  ;;             (neotree-find file-name))))))

  (setq neo-smart-open t)
  ;;(setq neo-autorefresh t)
  (setq neo-window-fixed-size nil)
  (setq neo-force-change-root t) ;; avoid the confirmation message
  (setq inhibit-compacting-font-caches t)
  (setq neo-theme 'icons)

  (add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "r") 'neotree-rename-node)
              (define-key evil-normal-state-local-map (kbd "a") 'neotree-create-node)
              (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
              (define-key evil-normal-state-local-map (kbd "f") 'neotree-refresh)
              (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
              (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
              (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)
              ))

  ;; (with-eval-after-load 'projectile
  ;;   (local-set-key (kbd "<f2>") 'neotree-project-dir-toggle)
  ;;   )
  )

(use-package all-the-icons
  :ensure t
  :after neotree
  :config
  (setq inhibit-compacting-font-caches t)
  (setq all-the-icons-scale-factor 1.1))

(provide 'init-neotree)
;;; init-neotree.el ends here
