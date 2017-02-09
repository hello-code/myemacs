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
(require 'init-exec-path)

;;----------------------------------------------------------------------------
;; Load custom configs
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/custom/")
(require 'my-configs)
(require 'my-mode-line)
(require 'my-org)

;;-------------------------------------------------------------
;; Load configs for specific program language
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/lang/")
(require 'init-go)
(require 'init-qml)
(require 'init-javascript)

;;----------------------------------------------------------------------------
;; Load configs for utility
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/utils/")
(require 'init-evil)
(require 'init-helm)
(require 'init-highlight-symbol)

(require 'init-ace)
(require 'init-which-key)
;;(require 'init-window-numbering)
;; (require 'init-hideshowvis)

;; (require 'init-pomodoro)
;; (require 'init-yasnippet)


(provide 'init)
;;; init.el ends here
