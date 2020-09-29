;;; init-lsp --- lsp
;;; Commentary:
;;; https://github.com/emacs-lsp/lsp-mode
;;; https://github.com/emacs-lsp/lsp-ui
;;; https://github.com/tigersoldier/company-lsp
;;; Code:

;; ------------------------------------------
;; golang
;; ------------------------------------------
;; go get -u -v golang.org/x/tools/cmd/gopls
(use-package go-mode
  :ensure t
  :hook(lsp-deferred . go-mode)
  :config
  (setq gofmt-command "goimports")
  ;;(add-hook 'before-save-hook 'gofmt-before-save)
  )

;; ------------------------------------------
;; python
;; ------------------------------------------
(use-package virtualenvwrapper
  :ensure t
  :commands(venv-workon)
  :config
  (venv-initialize-interactive-shells) ;; if you want interactive shell support
  (venv-initialize-eshell) ;; if you want eshell support
  ;; note that setting `venv-location` is not necessary if you
  ;; use the default location (`~/.virtualenvs`), or if the
  ;; the environment variable `WORKON_HOME` points to the right place
  (setq venv-location "~/development/python/")
  )

(use-package python
  :ensure t
  :hook(lsp-deferred . python-mode))

(use-package py-autopep8 :ensure t
  :init
  (setq py-autopep8-options '("--max-line-length=100")))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;; ;; ---------------------------------------------------

;; ---------------------------------------------------
;; lsp
;; ---------------------------------------------------
;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
(setq lsp-keymap-prefix "C-l")

(use-package lsp-mode
  :ensure t
  :commands(lsp lsp-deferred)
  :hook ((
          go-mode
          python-mode
          js-mode typescript-mode js2-mode rjsx-mode
          ) . lsp)
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-enable-snippet nil)
  (setq gofmt-command "goimports")
  )

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package lsp-ui
  :ensure t
  :requires lsp-mode flycheck
  ;; :bind("C-c l" . lsp-ui-imenu)
  :config
  (setq
   ;; lsp-ui-doc
   lsp-ui-doc-enable t
   lsp-ui-doc-header t
   lsp-ui-doc-border (face-foreground 'default)
   lsp-ui-doc-position 'at-point
   ;; lsp-ui-imenu
   lsp-ui-imenu-enable t
   ;; lsp-ui-peek
   (lsp-ui-peek-enable t)
   ;; (lsp-ui-peek-peek-height 20)
   ;; (lsp-ui-peek-list-width 50)
   ;; (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
   )
  (custom-set-faces
   '(lsp-ui-doc-background ((t :background "black")))
   '(lsp-ui-doc-header ((t :foreground "#ff8000" :background "#00ff00")))
   '(lsp-ui-doc-url ((t :inherit link))))
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :requires company
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-cache-candidates 'auto) ;; ignore case

  ;; Disable client-side cache because the LSP server does a better job.
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil))

(use-package lsp-ivy
  :after(lsp ivy)
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :after(lsp treemacs)
  :ensure t
  :commands lsp-treemacs-errors-list
  :config
  (lsp-metals-treeview-enable t)
  (setq lsp-metals-treeview-show-when-views-received t)
  )
(provide 'init-lsp)
;;; init-lsp.el ends here
