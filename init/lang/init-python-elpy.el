;;; init-python-elpy --- elpy python
;;; Commentary:
;;; https://github.com/jorgenschaefer/elpy
;;; https://github.com/porterjamesj/virtualenvwrapper.el
;;; Code:
;;; pip install jedi flake8 autopep8 yapf
;;; 1. pyvenv-workon
;;; 2. open .py file

;; The package is "python" but the mode is "python-mode":
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (setq python-indent-offset 4
        python-indent-guess-indent-offset nil)
  )

(use-package elpy
  :ensure t
  :after (python)
  :init(elpy-enable)
  ;;:init (with-eval-after-load 'python (elpy-enable))
  :config
  ;; remove yasnippet before elpy-enable
  (setq elpy-modules (delq 'elpy-module-yasnippet elpy-modules))
  ;; use flycheck not flymake with elpy
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  (add-hook 'elpy-mode-hook
            (lambda()
              (add-hook 'before-save-hook 'elpy-format-code nil 'what)
              )))

;; enable autopep8 formatting on save
(use-package py-autopep8
  :ensure t
  :after(elpy-mode)
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )

(provide 'init-python-elpy)
;;; init-python-elpy.el ends here
