;;; init-neotree --- side bar
;;; Commentary:
;;; Code:

(require 'package)

(defvar neotree-packages
  '(
    neotree
    all-the-icons
    projectile
    ))

(dolist (package neotree-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; (global-set-key (kbd "C-x s") 'neotree-toggle) ; use evil-leader

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

(defun neotree-project-dir-toggle ()
  "Open NeoTree using the project root."
  (interactive)
  (let ((project-dir
         (ignore-errors
           (projectile-project-root)
           ))
        (file-name (buffer-file-name))
        (neo-smart-open t))
    (if (and (fboundp 'neo-global--window-exists-p)
             (neo-global--window-exists-p))
        (neotree-hide)
      (progn
        (neotree-show)
        (if project-dir
            (neotree-dir project-dir))
        (if file-name
            (neotree-find file-name))))))


(with-eval-after-load "neotree"
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (require 'all-the-icons)
  (setq neo-smart-open t)
  (setq neo-autorefresh t)
  (setq neo-window-fixed-size nil)
)

(projectile-global-mode)
;;(setq projectile-switch-project-action 'neotree-projectile-action)

(provide 'init-neotree)
;;; init-neotree.el ends here
