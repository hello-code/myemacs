;;; init-lsp-python --- python
;;; Commentary:
;;; https://github.com/emacs-lsp/lsp-mode
;;;; Code:
;;; virtualenv: pip install 'python-language-server[all]'
;;; source bin/activate then emacs yourfile.py
;;; disable fci-mode
;;; 1. M-x venv-workon
;;; 2. open .py file

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

(use-package lsp-mode :ensure t :defer)

(use-package lsp-ui
  :ensure t
  :after(lsp)
  :init
  (add-hook 'python-mode-hook 'flycheck-mode)
  )

(use-package company-lsp
  :ensure t
  :after(company lsp)
  :config
  (push 'company-lsp company-backends))

(use-package python
  :mode ("\\.py\\'" . python-mode)
  ;; :interpreter ("python" . python-mode)
  ;; :mode "\\.py\\'"
  :config
  ;; (use-package lsp)
  ;; (use-package lsp-clients)
  (require 'lsp)
  (require 'lsp-clients)
  (setq lsp-prefer-flymake nil)
  (add-hook 'python-mode-hook 'lsp)
  )

(provide 'init-lsp-python)
;;; init-lsp-python.el ends here
