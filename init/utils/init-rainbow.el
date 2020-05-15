;;; init-rainbow --- rainbow
;;; Commentary:
;;; Code:

(use-package rainbow-mode
  ;;:defer t
  :ensure t
  :diminish rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode)
  )

(use-package rainbow-delimiters
  ;;:defer t
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(provide 'init-rainbow)
;;; init-rainbow.el ends here
