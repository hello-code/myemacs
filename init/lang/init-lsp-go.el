;;; init-lsp-go --- golang
;;; Commentary:
;;; https://github.com/dominikh/go-mode.el
;;; https://github.com/sourcegraph/go-langserver
;;; go get -u github.com/sourcegraph/go-langserver
;;; Code:

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :config
  (add-hook 'go-mode-hook 'lsp)
  )

(provide 'init-lsp-go)
;;; init-lsp-go.el ends here
