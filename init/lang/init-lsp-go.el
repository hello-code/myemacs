;;; init-lsp-go --- golang
;;; Commentary:
;;; https://github.com/dominikh/go-mode.el
;;; go get -u -v golang.org/x/tools/cmd/gopls
;;; Code:

(use-package go-mode
  :ensure t
  :commands go
  :config
  (setq gofmt-command "goimports")
  (add-hook 'go-mode-hook 'lsp)
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(provide 'init-lsp-go)
;;; init-lsp-go.el ends here
