;;; init.el --- init
;;; Commentary:
;;; Code:
;; * Startup Changes in Emacs 27.1

;; +++
;; ** Emacs can now be configured using an early init file.
;; The file is called 'early-init.el', in 'user-emacs-directory'.  It is
;; loaded very early in the startup process: before graphical elements
;; such as the tool bar are initialized, and before the package manager
;; is initialized.  The primary purpose is to allow customizing how the
;; package system is initialized given that initialization now happens
;; before loading the regular init file (see below).

;; +++
;; ** Emacs now calls 'package-initialize' before loading the init file.
;; This is part of a change intended to eliminate the behavior of
;; package.el inserting a call to 'package-initialize' into the init
;; file, which was previously done when Emacs was started.  As a result
;; of this change, it is no longer necessary to call 'package-initialize'
;; in your init file.  However, if your init file changes the values of
;; 'package-load-list' or 'package-user-dir', then that code needs to be
;; moved to the early init file (see above).

;; put (package-initialize) in "~/.emacs.d/early-init.el"
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

;;----------------------------------------------------------------------------
;; Load configs for specific program language
;;----------------------------------------------------------------------------

(add-to-list 'load-path "~/myemacs/init/lang/")

(require 'init-web)
(require 'init-javascript)
(require 'init-go)
(require 'init-qml)
;(require 'init-python)
(require 'init-markdown)

;;----------------------------------------------------------------------------
;; Load configs for utility
;;----------------------------------------------------------------------------

(add-to-list 'load-path "~/myemacs/init/utils/")

(require 'init-material-theme)
(require 'init-evil)
(require 'init-helm)
(require 'init-which-key)
(require 'init-winum) ;; window number
(require 'init-projectile)
(require 'init-neotree)
(require 'init-smooth-scrolling)
(require 'init-fci-mode) ;; fill-column-indicator 80
(require 'init-hlinum)
(require 'init-rainbow)
(require 'init-yasnippet)
;; (require 'init-highlight-symbol)
;; (require 'init-ace)
;; (require 'init-ox-reveal)
;; (require 'init-imenu-list)
;; ;;(require 'init-spaceline)
(require 'init-pomodoro)

(require 'init-dim) ;; change major/minor mode name
(provide 'init)
;;; init.el ends here

;; custom-set-variables custom-set-faces 相关配置存放在custom-file指定的文件内
(setq custom-file (concat user-emacs-directory "conf/custom-file.el"))
(load custom-file t t )
