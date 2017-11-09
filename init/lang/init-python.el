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
    company-jedi
    py-autopep8
    ))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package python-packages)
  (unless (package-installed-p package)
    (package-install package)))

(elpy-enable)

(defun my-python-mode-hook()
  ;;(exec-path-from-shell-copy-envs '("WORKON_HOME" "VIRTUALENV_PYTHON"))
  (local-set-key (kbd "<f12>") 'elpy-goto-definition)
  (local-set-key (kbd "S-<f12>") 'pop-tag-mark)
  )

;; 语法检查
(when (require 'flycheck nil t)
  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'python-mode-hook 'my-python-mode-hook)

;; autopep8 (pip install autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))

(provide 'init-python)
;;; init-python.el ends here
