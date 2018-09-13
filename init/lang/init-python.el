;;; init-python --- python
;;; Commentary:
;;; Code:
;;; virtualenv: pip install 'python-language-server[all]'
;;; source bin/activate then emacs yourfile.py
;;; disable fci-mode

(use-package lsp-mode
  :ensure t
  ;;:defer 1 ;; don't defer
  :config
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
  
  ;; get lsp-python-enable defined
  ;; NB: use either projectile-project-root or ffip-get-project-root-directory
  ;;     or any other function that can be used to find the root directory of a project
  (lsp-define-stdio-client lsp-python "python"
                           #'projectile-project-root
                           '("pyls"))
  
  ;; make sure this is activated when python-mode is activated
  ;; lsp-python-enable is created by macro above 
  (add-hook 'python-mode-hook
            (lambda ()
              (lsp-python-enable)))

  )

(use-package lsp-ui
  :ensure t
  ;;:defer 1 ;; don't defer
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  )

(use-package company-lsp
  :ensure t
  ;;:defer 1 ;; don't defer
  :config
  (push 'company-lsp company-backends))

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
                  (not (file-exists-p (concat root-dir ".venv"))))

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

  (add-hook 'python-mode-hook 'activate-venv)
  )

(provide 'init-python)
;;; init-python.el ends here
