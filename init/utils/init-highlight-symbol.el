 ;;; init-highlight-symbol.el --- 高亮同名符号
;;; Commentary:
;;https://github.com/nschum/highlight-symbol.el

;;; Code:

(use-package highlight-symbol
  :defer t
  :ensure t
  :diminish(highlight-symbol-mode . "hls")
  :config
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (setq highlight-symbol-idle-delay 0.2)
  (setq highlight-symbol-highlight-single-occurrence nil)
  (setq highlight-symbol-foreground-color "black")
  :custom-face
  (highlight-symbol-face ((t (:background "gray30" :inverse-video t))))
  )

(provide 'init-highlight-symbol)
;;; init-highlight-symbol.el ends here
