;;; init-python --- python
;;; Commentary:
;;; https://github.com/jorgenschaefer/elpy
;;; https://github.com/porterjamesj/virtualenvwrapper.el
;;; Code:

;; list packages for python
(defvar python-packages
  '(elpy
    virtualenvwrapper
    projectile
    py-autopep8))

(my-install-packages python-packages)

;; PYTHON CONFIGURATION
;; ------------------------------------------
(elpy-enable)

(setq elpy-modules (delq 'elpy-module-yasnippet elpy-modules))

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'virtualenvwrapper)
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

;; ;; -----------------------------------------------------
;; ;; use lsp-mode
;; ;; -----------------------------------------------------
;; ;; virtualenv: pip install 'python-language-server[all]'
;; ;; source bin/activate then emacs yourfile.py
;; ;; disable fci-mode

;; ;; list packages for python
;; (defvar python-packages
;;   '(
;;     lsp-mode
;;     lsp-ui
;;     lsp-python
;;     company-lsp
;;     projectile
;;     py-autopep8
;;     virtualenvwrapper
;;     ))
;; (my-install-packages python-packages)

;; (require 'lsp-imenu)
;; (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

;; (require 'lsp-mode)
;; (require 'lsp-python)
;; (lsp-define-stdio-client lsp-python "python"
;;                          #'projectile-project-root
;;                          '("pyls"))

;; ;; make sure this is activated when python-mode is activated
;; ;; lsp-python-enable is created by macro above
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (lsp-python-enable)))
;; ;;(add-hook 'python-mode-hook #'lsp-python-enable)

;; (require 'lsp-ui)
;; (setq lsp-ui-sideline-ignore-duplicate t)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; (require 'company-lsp)
;; (push 'company-lsp company-backends)

;; (with-eval-after-load 'lsp-ui
;;   (setq company-quickhelp-delay nil))

;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
;; ;; To customize the behaviour of autopep8 you can set the py-autopep8-options e.g.
;; ;; (setq py-autopep8-options '("--max-line-length=100"))

;; (add-hook 'lsp-ui-doc-frame-hook
;;           (lambda (frame _w)
;;             (set-face-attribute 'default frame :font "Hack" :height 130)))

;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; ;; note that setting `venv-location` is not necessary if you
;; ;; use the default location (`~/.virtualenvs`), or if the
;; ;; the environment variable `WORKON_HOME` points to the right place
;; (setq venv-location "~/development/python/")

;; ;; https://stackoverflow.com/questions/21246218/how-can-i-make-emacs-jedi-use-project-specific-virtualenvs?rq=1
;; (defun project-directory (buffer-name)
;;   "Return the root directory of the project that contain the given BUFFER-NAME.
;; Any directory with a .git or .jedi or .projectile file/directory
;; is considered to be a project root."
;;   (interactive)
;;   (let ((root-dir (file-name-directory buffer-name)))
;;     (while (and root-dir
;;                 (not (file-exists-p (concat root-dir ".projectile")))
;;                 (not (file-exists-p (concat root-dir ".git")))
;;                 (not (file-exists-p (concat root-dir ".venv"))))

;;       (setq root-dir
;;             (if (equal root-dir "/")
;;                 nil
;;               (file-name-directory (directory-file-name root-dir)))))
;;     root-dir))

;; (defun project-name (buffer-name)
;;   "Return the name of the project that contain the given BUFFER-NAME."
;;   (let ((root-dir (project-directory buffer-name)))
;;     (if root-dir
;;         (file-name-nondirectory
;;          (directory-file-name root-dir))
;;       nil)))

;; (defun activate-venv ()
;;   "Activates the virtualenv of the current buffer."
;;   (let ((project-name (project-name buffer-file-name)))
;;     (when project-name (venv-workon project-name))))

;; (add-hook 'python-mode-hook 'activate-venv)

;; ------------------------------------------------
(provide 'init-python)
;;; init-python.el ends here
