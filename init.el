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

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))
;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Update package-archive lists
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("org" . "http://elpa.emacs-china.org/org/")))

(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))

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
(require 'my-configs)
(require 'my-org)
;;----------------------------------------------------------------------------
;; Load configs for specific program language
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/lang/")
(require 'init-python)
(require 'init-go)
(require 'init-web)
(require 'init-javascript)
;; (require 'init-qml)
;; (require 'init-markdown)
;;----------------------------------------------------------------------------
;; Load configs for utility
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/init/utils/")
(require 'init-spacemacs-theme)
(require 'init-spaceline)
(require 'init-ivy)
(require 'init-which-key)
(require 'init-evil)
(require 'init-winum) ;; window number
(require 'init-neotree)
(require 'init-smooth-scrolling)
(require 'init-fci-mode) ;; fill-column-indicator 80
;; (require 'init-hlinum) ;; emacs 26.1(display-line-numbers-mode)
(require 'init-highlight-symbol)
(require 'init-rainbow)
(require 'init-pomodoro)
(require 'init-fold-this)
(require 'init-projectile)

;; ;; (require 'init-ox-reveal)
;; ;; (require 'init-imenu-list)

(provide 'init)
;;; init.el ends here

;; custom-set-variables custom-set-faces 相关配置存放在custom-file指定的文件内
(setq custom-file (concat user-emacs-directory "conf/custom-file.el"))
(load custom-file t t )
