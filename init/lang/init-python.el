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

;; python mode hook
(defun my-python-mode-hook()
  (exec-path-from-shell-copy-envs '("WORKON_HOME" "VIRTUALENV_PYTHON"))
  (local-set-key (kbd "<f12>") 'anaconda-mode-find-definitions)
  (local-set-key (kbd "M-/") 'anaconda-mode-go-back)
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(with-eval-after-load 'python-mode
  (with-eval-after-load 'company
    (add-hook 'python-mode-hook
              '(lambda()
                 (set(make-local-variable 'company-backends) '(company-anaconda))
                 (company-mode)))))

(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

;; virtual environment
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location "~/development/python")

(provide 'init-python)
;;; init-python.el ends here
