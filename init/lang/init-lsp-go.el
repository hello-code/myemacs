;;; init-lsp-go.el ends here
;;; init-lsp-go --- lsp golang
;;; Commentary:
;;; Code:

(use-package lsp-mode :ensure t :defer)

(use-package lsp-ui
  :ensure t
  :after(lsp)
  :init
  (add-hook 'go-mode-hook 'flycheck-mode))

(use-package company-lsp
  :ensure t
  :after(company lsp)
  :config
  (push 'company-lsp company-backends))

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :config
  (require 'lsp)
  (require 'lsp-clients)
  ;;(setq lsp-prefer-flymake nil)
  (add-hook 'go-mode-hook 'lsp)
  )

(provide 'init-lsp-go)
;;; init-lsp-go.el ends here
