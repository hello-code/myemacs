;;; init-python-lsp --- lsp mode for python
;;; Commentary:
;;; Code:
;;; virtualenv: pip install 'python-language-server[all]'
;;; source bin/activate then emacs yourfile.py
;;; disable fci-mode
;;; 1. M-x venv-workon
;;; 2. open .py file

(use-package virtualenvwrapper
  :ensure t
  :commands(venv-workon)
  :config
  (venv-initialize-interactive-shells) ;; if you want interactive shell support
  (venv-initialize-eshell) ;; if you want eshell support
  ;; note that setting `venv-location` is not necessary if you
  ;; use the default location (`~/.virtualenvs`), or if the
  ;; the environment variable `WORKON_HOME` points to the right place
  (setq venv-location "~/development/python/")
  )

(use-package lsp-mode
    :config
    (add-hook 'python-mode-hook
        (lambda ()
            (lsp-python-enable)))
    ;; 调用 pyls 既上边安装的 Python Language Server
    ;; 不需要安装 lsp-python, 以下几行提供与 lsp-python 相同的功能
    (lsp-define-stdio-client lsp-python "python"
            (lsp-make-traverser #'(lambda (dir)
                        (directory-files
                        dir
                        nil
                        "\\(__init__\\|setup\\)\\.py\\|Pipfile")))
            '("pyls")))

(use-package lsp-imenu
    :init
    ;; 启用 lsp-imenu 集成
    (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

(use-package lsp-ui
    :init
    ;; 启用 lsp-ui
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    ;; 启用 flycheck
    (add-hook 'python-mode-hook 'flycheck-mode))
    
(use-package company-lsp
    :config
    ;; 设置 company-lsp 为后端
    (push 'company-lsp company-backends))

;; ;; The package is "python" but the mode is "python-mode":
;; (use-package python
;;   :mode ("\\.py\\'" . python-mode)
;;   :interpreter ("python" . python-mode)
;;   :init
;;   (setq python-indent-offset 4
;;         python-indent-guess-indent-offset nil)
;;   ;;:config
;;   ;; (cond ((not(eq system-type 'windows-nt))
;;   ;;        (exec-path-from-shell-copy-envs '("WORKON_HOME"))))
;;   )

;; (use-package lsp-mode
;;   :after(python)
;;   :ensure t
;;   ;;:defer 1 ;; don't defer
;;   ;;:after (python-mode)
;;   :config
;;   (add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
;;   (lsp-define-stdio-client lsp-python "python"
;;                            #'projectile-project-root
;;                            '("pyls"))
;;   ;; make sure this is activated when python-mode is activated
;;   ;; lsp-python-enable is created by macro above 
;;   (add-hook 'python-mode-hook
;;             (lambda ()
;;               (lsp-python-enable)))

;;   )

;; (use-package lsp-ui
;;   :ensure t
;;   :after(lsp-mode)
;;   ;;:defer 1 ;; don't defer
;;   :config
;;   (setq lsp-ui-sideline-ignore-duplicate t)
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;   )

;; (use-package company-lsp
;;   :ensure t
;;   :after(company-mode lsp-mode)
;;   ;;:defer 1 ;; don't defer
;;   :config
;;   (push 'company-lsp company-backends))

(provide 'init-python-lsp)
;;; init-python-lsp.el ends here
