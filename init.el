;;; init.el --- init
;;; Commentary:
;;; Code:

;;----------------------------------------------------------------------------
;; Load package configs
;;----------------------------------------------------------------------------

(package-initialize)

(add-to-list 'load-path "~/myemacs/init/")
(require 'init-elpa)
(require 'init-flycheck)
(require 'init-company)
;; printf command not recognized
;; don't call exec-path-from-shell function on windows
(require 'init-exec-path)

;;----------------------------------------------------------------------------
;; Load custom configs
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/custom/")
(require 'my-configs)
;(require 'my-mode-line)
(require 'my-org)

;;-------------------------------------------------------------
;; Load configs for specific program language
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/lang/")
(require 'init-go)
(require 'init-qml)
(require 'init-javascript)
(require 'init-python)
(require 'init-web)

;;----------------------------------------------------------------------------
;; Load configs for utility
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/utils/")
(require 'init-evil)
(require 'init-helm)
(require 'init-highlight-symbol)
(require 'init-ace)
(require 'init-which-key)
(require 'init-hideshowvis)
(require 'init-pomodoro)
(require 'init-yasnippet)
(require 'init-ox-reveal)
(require 'init-neotree)
(require 'init-imenu-list)
(require 'init-markdown)
(require 'init-smart-mode-line)
(require 'init-material-theme)
(require 'init-fci-mode)

(provide 'init)
;;; init.el ends here

;; custom-set-variables custom-set-faces 相关配置存放在custom-file指定的文件内
(setq custom-file (concat user-emacs-directory "conf/custom-file.el"))
(load custom-file t t )
