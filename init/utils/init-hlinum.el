;;; init-hlinum --- highlight line number
;;; Commentary:
;;; https://github.com/tom-tan/hlinum-mode
;;; Code:

(use-package hlinum
  :ensure t
  :defer 3
  :custom-face
  (linum-highlight-face ((t (:background "orange" :foreground "black" :weight bold))))
  :config
  (hlinum-activate)
  (setq linum-highlight-in-all-buffersp t)

  ;; (defvar ml-selected-window nil)

  ;; (defun ml-record-selected-window ()
  ;;   (setq ml-selected-window (selected-window)))

  ;; (defun ml-update-all ()
  ;;   (force-mode-line-update t))

  ;; (add-hook 'post-command-hook 'ml-record-selected-window)

  ;; (add-hook 'buffer-list-update-hook 'ml-update-all)

  ;; (setq-default mode-line-format
  ;;               '(:eval
  ;;                 (if (eq ml-selected-window (selected-window))
  ;;                     "ACTIVE"
  ;;                   "INACTIVE")))

  )
(provide 'init-hlinum)
;;; init-hlinum.el ends here
