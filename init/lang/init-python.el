;;; init-python --- python
;;; Commentary:
;;; Code:

;; list packages for python
(defvar python-packages
  '(elpy
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

;; ;; use lsp-mode
;; ;; -----------------------------------------------------
;; ;; virtualenv: pip install python-language-server
;; ;; source bin/activate then emacs yourfile.py

;; ;; list packages for python
;; (defvar python-packages
;;   '(
;;     lsp-mode
;;     lsp-python
;;     company-lsp
;;     lsp-ui))

;; (require 'package)
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; (dolist (package python-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; (require 'lsp-mode)
;; (require 'lsp-python)
;; (require 'company-lsp)
;; (push 'company-lsp company-backends)
;; (add-hook 'python-mode-hook #'lsp-python-enable)

;; (require 'lsp-ui)
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; ;; ------------------------------------------------
(provide 'init-python)
;;; init-python.el ends here
