;;; init-hlinum --- highlight line number
;;; Commentary:
;;; https://github.com/tom-tan/hlinum-mode
;;; Code:

(use-package hlinum
  :ensure t
  :defer 3
  :config
  (hlinum-activate)
  (setq linum-highlight-in-all-buffersp t)
  :custom-face
  (linum-highlight-face ((t (:background "orange" :foreground "black" :weight bold))))
  )

(provide 'init-hlinum)
;;; init-hlinum.el ends here
