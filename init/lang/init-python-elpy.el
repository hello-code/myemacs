;;; init-python --- python
;;; Commentary:
;;; https://github.com/jorgenschaefer/elpy
;;; https://github.com/porterjamesj/virtualenvwrapper.el
;;; Code:
;;; pip install jedi flake8 autopep8 yapf

(use-package elpy
  :ensure t
  :config
  ;; remove yasnippet before elpy-enable
  (setq elpy-modules (delq 'elpy-module-yasnippet elpy-modules))

  (elpy-enable)

  ;; use flycheck not flymake with elpy
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  )

;; enable autopep8 formatting on save
(use-package py-autopep8
  :ensure t
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )

(use-package virtualenvwrapper
  :ensure t
  ;;:defer 1 ;; don't defer
  :config
  (venv-initialize-interactive-shells) ;; if you want interactive shell support
  (venv-initialize-eshell) ;; if you want eshell support
  ;; note that setting `venv-location` is not necessary if you
  ;; use the default location (`~/.virtualenvs`), or if the
  ;; the environment variable `WORKON_HOME` points to the right place
  (setq venv-location "~/development/python/")
  )

(provide 'init-python)
;;; init-python.el ends here
