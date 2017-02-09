;;; init.el --- init
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; custom config
(push "~/myemacs/configs" load-path)
(push "~/myemacs/init" load-path)

(require 'my-configs)
(require 'my-mode-line)
(require 'my-org)

;; package config
(require 'init-flycheck)
(require 'init-company)
(require 'init-go)
(require 'init-helm)
(require 'init-which-key)
(require 'init-pomodoro)
(require 'init-window-numbering)
(require 'init-evil)
(require 'init-web)
(require 'init-qml)
(require 'init-yasnippet)
(require 'init-javascript)
(require 'init-highlight-symbol) ; 高亮同名符号
(require 'init-hideshowvis) ; 代码折叠

(provide 'init)
;;; init.el ends here
;;;====================
