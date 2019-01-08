;;; init-lsp --- lsp
;;; Commentary:
;;; https://github.com/emacs-lsp/lsp-mode
;;; https://github.com/emacs-lsp/lsp-ui
;;; https://github.com/tigersoldier/company-lsp
;;; Code:

(use-package lsp-mode
  :ensure t
  :defer
  :init
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui :ensure t :after(lsp))

(use-package company-lsp
  :ensure t
  :after(company lsp)
  :config
  (push 'company-lsp company-backends))

(provide 'init-lsp)
;;; init-lsp.el ends here
