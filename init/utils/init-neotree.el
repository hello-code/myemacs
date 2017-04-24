;;; init-neotree --- side bar
;;; Commentary:
;;; Code:

(require 'package)

(defvar neotree-packages
  '(
    neotree
    all-the-icons
    ))

(dolist (package neotree-packages)
  (unless (package-installed-p package)
    (package-install package)))

(global-set-key (kbd "C-x s") 'neotree-toggle)

(add-hook 'neotree-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(with-eval-after-load "neotree"
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (require 'all-the-icons))

(provide 'init-neotree)
;;; init-neotree.el ends here
