;;; init-lsp-python --- python
;;; Commentary:
;;; virtualenv: pip install 'python-language-server[all]'
;;; source bin/activate then emacs yourfile.py
;;; or:
;;; 1. M-x venv-workon
;;; 2. open .py file
;;; disable fci-mode
;;; Code:

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

(use-package py-autopep8
  :ensure t
  :init
  (setq py-autopep8-options '("--max-line-length=100")))

(use-package python
  :config
  (add-hook 'python-mode-hook 'lsp)
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  )

(provide 'init-lsp-python)
;;; init-lsp-python.el ends here
