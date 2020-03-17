;;; init-lsp --- lsp
;;; Commentary:
;;; https://github.com/emacs-lsp/lsp-mode
;;; https://github.com/emacs-lsp/lsp-ui
;;; https://github.com/tigersoldier/company-lsp
;;; Code:

(use-package lsp-mode
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  :init (setq lsp-keymap-prefix "s-l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))

;; ;; ------------------------------------------
;; ;; golang
;; ;; ------------------------------------------
;; ;; go get -u -v golang.org/x/tools/cmd/gopls
;; (use-package go-mode :ensure t)

;; ;; ------------------------------------------
;; ;; python
;; ;; ------------------------------------------
;; (use-package virtualenvwrapper
;;   :ensure t
;;   :commands(venv-workon)
;;   :config
;;   (venv-initialize-interactive-shells) ;; if you want interactive shell support
;;   (venv-initialize-eshell) ;; if you want eshell support
;;   ;; note that setting `venv-location` is not necessary if you
;;   ;; use the default location (`~/.virtualenvs`), or if the
;;   ;; the environment variable `WORKON_HOME` points to the right place
;;   (setq venv-location "~/development/python/")
;;   )

;; (use-package python-mode :ensure t)
;; (use-package py-autopep8 :ensure t
;;   :init
;;   (setq py-autopep8-options '("--max-line-length=100")))
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;; ;; ---------------------------------------------------


;; ;; ---------------------------------------------------
;; ;; lsp
;; ;; ---------------------------------------------------
;; (use-package lsp-mode
;;   :ensure t
;;   :commands(lsp lsp-deferred)
;;   :hook (
;;          (go-mode . lsp-deferred)
;;          (python-mode . lsp-deferred)
;;          )
;;   :config
;;   (setq lsp-prefer-flymake nil)
;;   (setq gofmt-command "goimports")
;;   )

;; ;; Set up before-save hooks to format buffer and add/delete imports.
;; ;; Make sure you don't have other gofmt/goimports hooks enabled.
;; (defun lsp-go-install-save-hooks ()
;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; (use-package lsp-ui
;;   :ensure t
;;   :requires lsp-mode flycheck
;;   :config
;;   (setq lsp-ui-doc-enable t
;;         lsp-ui-doc-use-childframe t
;;         lsp-ui-doc-delay 0.5
;;         lsp-ui-doc-border (face-foreground 'default)
;;         lsp-ui-doc-position 'at-point
;;         lsp-ui-doc-include-signature t
;;         lsp-ui-sideline-enable nil
;;         lsp-ui-flycheck-enable t
;;         lsp-ui-flycheck-list-position 'right
;;         lsp-ui-flycheck-live-reporting t
;;         lsp-ui-peek-enable t
;;         lsp-ui-peek-list-width 60
;;         lsp-ui-peek-peek-height 25)
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; (use-package company-lsp
;;   :ensure t
;;   :requires company
;;   :config
;;   (push 'company-lsp company-backends)
;;   (setq company-lsp-cache-candidates 'auto) ;; ignore case

;;   ;; Disable client-side cache because the LSP server does a better job.
;;   (setq company-transformers nil
;;         company-lsp-async t
;;         company-lsp-cache-candidates nil))

;; ;; Optional - provides snippet support.
;; (use-package yasnippet
;;   :ensure t
;;   :commands yas-minor-mode
;;   :hook (go-mode . yas-minor-mode))

(provide 'init-lsp)
;;; init-lsp.el ends here
