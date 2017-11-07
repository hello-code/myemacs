;;; init-python --- python
;;; Commentary:
;; sudo apt-get install virtualenvwrapper
;; export WORKON_HOME=~/development/python
;; export VIRTUALENV_PYTHON=/usr/bin/python3
;;; Code:

;; list packages for python
(defvar python-packages
  '(
    elpy
    virtualenvwrapper
    company-jedi
    auto-virtualenv
    py-autopep8
    ))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package python-packages)
  (unless (package-installed-p package)
    (package-install package)))

(elpy-enable)

;; 语法检查
(when (require 'flycheck nil t)
  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; virtual environment
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/development/python")

;; auto-virtualenv
(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
;; Activate on changing buffers
(add-hook 'window-configuration-change-hook 'auto-virtualenv-set-virtualenv)
;; Activate on focus in
(add-hook 'focus-in-hook 'auto-virtualenv-set-virtualenv)

;; autopep8 (pip install autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))

(provide 'init-python)
;;; init-python.el ends here
