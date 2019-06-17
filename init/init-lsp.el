;;; init-lsp --- lsp
;;; Commentary:
;;; https://github.com/emacs-lsp/lsp-mode
;;; https://github.com/emacs-lsp/lsp-ui
;;; https://github.com/tigersoldier/company-lsp
;;; Code:

(use-package lsp-mode
  :ensure t
  :hook (go-mode . lsp) ;;  :hook (prog-mode . lsp)
  :commands lsp
  :config
  (setq lsp-enable-snippet nil)
  (setq lsp-prefer-flymake nil)
  (set-face-attribute 'lsp-face-highlight-read nil :background "red")
  (set-face-attribute 'lsp-face-highlight-textual nil :foreground "black" :background "orange")
  (set-face-attribute 'lsp-face-highlight-write nil :background "blue")
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  ;;(setq lsp-ui-doc-max-width 60)
  (setq lsp-ui-doc-position(quote at-point))
  (setq lsp-ui-sideline-ignore-duplicate t)
  (setq lsp-ui-sideline-enable nil)
  )

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-cache-candidates 'auto) ;; ignore case
  )

(provide 'init-lsp)
;;; init-lsp.el ends here
