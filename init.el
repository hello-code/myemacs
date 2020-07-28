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

;;; Increase the garbage collection threshold to 128 MB to ease startup
(setq gc-cons-threshold (* 128 1024 1024 ))

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;;----------------------------------------------------------------------------
;; use-package 
;;----------------------------------------------------------------------------
(require 'package)
(setq package-enable-at-startup nil)

;; (setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))

;; (setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
;;                          ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
;;                          ("melpa-stable" . "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
;;                          ("org" . "https://mirrors.ustc.edu.cn/elpa/org/")))

;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")
                         ("org"   . "https://elpa.emacs-china.org/org/")))

;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                          ("melpa" . "https://melpa.org/packages/")))

;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)



(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;----------------------------------------------------------------------------
;; benchmark
;;----------------------------------------------------------------------------
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package diminish :ensure t :defer 1)

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
    :ensure t
    :defer 1
    :config
    (exec-path-from-shell-initialize)
    (setq exec-path-from-shell-check-startup-files nil)))

;;----------------------------------------------------------------------------
;; Load package configs
;;----------------------------------------------------------------------------
(when (< emacs-major-version 27)
  (package-initialize))

(add-to-list 'load-path "~/myemacs/init/")
(require 'init-company)
(require 'init-flycheck)

;;----------------------------------------------------------------------------
;; Load custom configs
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/custom/")
;;(require 'my-mode-line)
(require 'my-configs)
(require 'my-org)

;;----------------------------------------------------------------------------
;; Load configs for utility
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/utils/")
(require 'init-doom-themes)
(require 'init-doom-modeline)
;;(require 'init-theme)
(require 'init-projectile)
(require 'init-ivy)
(require 'init-avy)
(require 'init-which-key)
(require 'init-evil)
;;(require 'init-ace-window)
(require 'init-winum)
(require 'init-fci-mode) ;; fill-column-indicator 80
(require 'init-highlight-symbol)
(require 'init-rainbow)
(require 'init-pomidor)
(require 'init-fold-this)
(require 'init-markdown)
(require 'init-reveal)  ;; ppt
(require 'init-yaml)
(require 'init-highlight-indent-guides)
(require 'init-treemacs)

;;----------------------------------------------------------------------------
;; Load configs for specific program language
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/lang/")
(require 'init-lsp)
(require 'init-web)
(require 'init-javascript)

;;; Garbage collector-decrease threshold to 5 MB
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))
(provide 'init)
;;; init.el ends here

;; custom-set-variables custom-set-faces 相关配置存放在custom-file指定的文件内
(setq custom-file (concat user-emacs-directory "conf/custom-file.el"))
(load custom-file t t )
