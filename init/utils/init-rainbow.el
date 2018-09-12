;;; init-rainbow --- rainbow
;;; Commentary:
;;; Code:

(use-package rainbow-mode
  :diminish rainbow-mode
  :ensure t
  :defer 3
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode)
  )

(use-package rainbow-delimiters
  :ensure t
  :defer 3
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

(provide 'init-rainbow)
;;; init-rainbow.el ends here
