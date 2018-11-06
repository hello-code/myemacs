;;; init-spaceline.el --- spaceline
;;; Commentary:
;;; https://github.com/TheBB/spaceline
;;; Code:

(use-package all-the-icons
  :ensure t
  :after neotree
  :config
  (setq inhibit-compacting-font-caches t))

;; (use-package spaceline
;;   :ensure t
;;   :init
;;   (require 'spaceline-config)
;;   (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
;;   :config
;;   (spaceline-spacemacs-theme))

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-emacs-theme)
  ;; (setq powerline-default-separator 'wave)
  ;; (spaceline-compile)

  (setq spaceline-workspace-numbers-unicode t
        spaceline-window-numbers-unicode t)

  ;; (diminish 'eldoc-mode)
  ;; (diminish 'whitespace-mode)
  ;; (diminish 'projectile-mode)
  ;; (diminish 'abbrev-mode)
  ;; (diminish 'buffer-face-mode)
  ;; (diminish 'flyspell-mode)
  ;; (diminish 'auto-revert-mode)
  ;; (diminish 'text-scale-mode)
  ;; (diminish 'flycheck-mode)
  ;; (diminish 'company-mode)
  ;; (spaceline-toggle-buffer-encoding-abbrev-off)
  ;; (spaceline-toggle-buffer-size-off)
  ;; (spaceline-toggle-erc-track-off)

  ;; spaceline-evil-state-faces is a variable defined in ‘spaceline.el’.
  ;; Its value is ((normal . spaceline-evil-normal)
  ;;  (insert . spaceline-evil-insert)
  ;;  (emacs . spaceline-evil-emacs)
  ;;  (replace . spaceline-evil-replace)
  ;;  (visual . spaceline-evil-visual)
  ;;  (motion . spaceline-evil-motion))
  ;;(setq spaceline-highlight-face-func #'spaceline-highlight-face-default)
  (setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state)
  )

(use-package spaceline-all-the-icons
  :ensure t
  :after spaceline
  :config
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
  (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
  (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
  (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
  (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
  )

(provide 'init-spaceline)
;;; init-spaceline.el ends here
