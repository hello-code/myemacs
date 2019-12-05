;;; init-lsp --- lsp
;;; Commentary:
;;; https://github.com/emacs-lsp/lsp-mode
;;; https://github.com/emacs-lsp/lsp-ui
;;; https://github.com/tigersoldier/company-lsp
;;; Code:

;; (use-package lsp-mode
;;   :ensure t
;;   :hook (go-mode . lsp) ;;  :hook (prog-mode . lsp)
;;   :commands lsp
;;   :config
;;   (setq lsp-enable-snippet nil)
;;   (setq lsp-prefer-flymake nil)
;;   (set-face-attribute 'lsp-face-highlight-read nil :background "red")
;;   (set-face-attribute 'lsp-face-highlight-textual nil :foreground "black" :background "orange")
;;   (set-face-attribute 'lsp-face-highlight-write nil :background "blue")
;;   )

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode
;;   :config
;;   ;;(setq lsp-ui-doc-max-width 60)
;;   ;;(setq lsp-ui-doc-position(quote at-point))
;;   (setq lsp-ui-sideline-ignore-duplicate t)
;;   (setq lsp-ui-sideline-enable nil)
;;   )

;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp
;;   :config
;;   (push 'company-lsp company-backends)
;;   (setq company-lsp-cache-candidates 'auto) ;; ignore case
;;   )


(use-package lsp-mode
  :ensure t
  ;; :hook (
  ;;        (python-mode . lsp-deferred)
  ;;        (go-mode . lsp-deferred))
  :commands(lsp lsp-deferred)
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :requires lsp-mode flycheck
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-flycheck-list-position 'right
        lsp-ui-flycheck-live-reporting t
        lsp-ui-peek-enable t
        lsp-ui-peek-list-width 60
        lsp-ui-peek-peek-height 25)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :requires company
  :config
  (push 'company-lsp company-backends)

  ;; Disable client-side cache because the LSP server does a better job.
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil))

(provide 'init-lsp)
;;; init-lsp.el ends here
