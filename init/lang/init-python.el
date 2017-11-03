;;; init-python --- python
;;; Commentary:
;; sudo apt-get install virtualenvwrapper
;; export WORKON_HOME=~/development/python
;; export VIRTUALENV_PYTHON=/usr/bin/python3
;;; Code:

;; list packages for python
(defvar python-packages
  '(anaconda-mode
    company-anaconda
    virtualenvwrapper))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package python-packages)
  (unless (package-installed-p package)
    (package-install package)))

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; virtual environment
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/development/python")

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

;; use .bashrc environment variable
(exec-path-from-shell-copy-envs '("WORKON_HOME" "VIRTUALENV_PYTHON"))

(provide 'init-python)
;;; init-python.el ends here
