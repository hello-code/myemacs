;;; init-avy.el --- jumping to visible text using a char-based decision tree
;;; Commentary:
;;; https://github.com/abo-abo/avy
;;; Code:

(use-package avy
  :ensure t
  ;;:commands (avy-goto-char)
  :bind("C-'" . avy-goto-char)
  :config
  (setq avy-background t)
  :custom-face
  (avy-lead-face ((t(:weight bold))))
  (avy-lead-face-0 ((t(:weight bold))))
  )

(provide 'init-avy)
;;; init-avy ends here
