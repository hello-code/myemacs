;;; init-spaceline.el --- spaceline
;;; Commentary:
;;; https://github.com/TheBB/spaceline
;;; Code:

(use-package all-the-icons :ensure t
  :defer 3
  :config
  (setq inhibit-compacting-font-caches t))

(use-package spaceline
  :ensure t
  :defer 1
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'wave
        spaceline-workspace-numbers-unicode t
        spaceline-window-numbers-unicode t
        spaceline-highlight-face-func 'spaceline-highlight-face-evil-state) ;; evil state on mode line
  (spaceline-compile)
  (spaceline-emacs-theme))

;; (use-package spaceline-all-the-icons :ensure t
;;   ;;:defer 1
;;   :after spaceline
;;   :config
;;   (spaceline-all-the-icons-theme)
;;   (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
;;   (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
;;   (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
;;   (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
;;   (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
;;   )

(provide 'init-spaceline)
;;; init-spaceline.el ends here
