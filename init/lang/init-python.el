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
    virtualenvwrapper
    projectile
    ))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package python-packages)
  (unless (package-installed-p package)
    (package-install package)))

(elpy-enable)

(defun my-python-mode-hook()
  ;;(exec-path-from-shell-copy-envs '("WORKON_HOME" "VIRTUALENV_PYTHON" "VIRTUAL_ENV"))
  (local-set-key (kbd "<f12>") 'elpy-goto-definition)
  (local-set-key (kbd "S-<f12>") 'pop-tag-mark)

  (require 'virtualenvwrapper)
  (venv-initialize-interactive-shells) ;; if you want interactive shell support
  (venv-initialize-eshell) ;; if you want eshell support
  ;; note that setting `venv-location` is not necessary if you
  ;; use the default location (`~/.virtualenvs`), or if the
  ;; the environment variable `WORKON_HOME` points to the right place
  ;; export WORKON_HOME=~/development/python
  (setq venv-location "~/development/python/")
  ;; As long as a virtualenv is found in the projectile-project-root and
  ;; whose name is in the list venv-dirlookup-names it will be automatically activated.
  ;; (require 'projectile)
  ;; (projectile-mode)
  ;; (setq projectile-enable-caching t)
  ;; (projectile-project-root)
  ;; ;;(setq projectile-project-root ".projectile")
  ;; (setq venv-dirlookup-names '(".projectile" ".venv" "pyenv" ".virtual"))
  ;; ;; Automatically activating a virtualenv when using projectile
  ;; (setq projectile-switch-project-action 'venv-projectile-auto-workon)
  )

;; https://stackoverflow.com/questions/21246218/how-can-i-make-emacs-jedi-use-project-specific-virtualenvs?rq=1
(defun project-directory (buffer-name)
  "Return the root directory of the project that contain the given BUFFER-NAME.
Any directory with a .git or .jedi or .projectile file/directory
is considered to be a project root."
  (interactive)
  (let ((root-dir (file-name-directory buffer-name)))
    (while (and root-dir
                (not (file-exists-p (concat root-dir ".projectile")))
                (not (file-exists-p (concat root-dir ".git")))
                (not (file-exists-p (concat root-dir ".jedi"))))
      
      (setq root-dir
            (if (equal root-dir "/")
                nil
              (file-name-directory (directory-file-name root-dir)))))
    root-dir))

(defun project-name (buffer-name)
  "Return the name of the project that contain the given BUFFER-NAME."
  (let ((root-dir (project-directory buffer-name)))
    (if root-dir
        (file-name-nondirectory
         (directory-file-name root-dir))
      nil)))

(defun activate-venv ()
  "Activates the virtualenv of the current buffer."
  (let ((project-name (project-name buffer-file-name)))
    (when project-name (venv-workon project-name))))

;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'activate-venv)
;; (add-hook 'python-mode-hook 'jedi:setup)

(add-hook 'python-mode-hook 'my-python-mode-hook)

;; 语法检查
(when (require 'flycheck nil t)
  (setq elpy-modules(delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; autopep8 (pip install autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=100"))

(provide 'init-python)
;;; init-python.el ends here
