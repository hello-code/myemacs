;;; init-ivy.el --- ivy
;;; Commentary:
;;; https://github.com/abo-abo/swiper
;;; Code:
;; https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/

(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")         ; does not display ivy in the modeline
  :init (ivy-mode 1)                ; enable ivy globally at startup
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq enable-recursive-minibuffers t)
  ;; (setq ivy-height 20)            ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
  )

(use-package counsel
  :ensure t
  :bind(("M-x" . counsel-M-x)
        ("C-x C-f" . counsel-find-file)))

(use-package swiper
  :ensure t
  :bind(("C-s" . swiper)))

(use-package general :ensure t
  :config
  ;; keys binding (different prefix key)
  (general-define-key
   :prefix "C-c"
   ;; bind to simple key press
   "b" 'ivy-switch-buffer  ; change buffer, chose using ivy
   "/" 'counsel-git-grep   ; find string in git project
   ;;"l" 'counsel-locate
   "l" 'lsp-ui-imenu
   "x" 'counsel-ag
   ;; bind to double key press
   "f"  '(:ignore t :which-key "files")
   "ff" 'counsel-find-file
   "fr"	'counsel-recentf
   "p"  '(:ignore t :which-key "project")
   "pf" '(counsel-git :which-key "find file in git dir")
   )
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"

   ;; simple command
   "/"   'counsel-ag
   "c"   'company-mode
   "f"   'flycheck-mode
   "l"   'counsel-locate
   "TAB" '(switch-to-other-buffer :which-key "prev buffer")
   "SPC" '(avy-goto-word-or-subword-1  :which-key "go to char")
   "w"   'ace-window

   ;; Applications
   "a"  '(:ignore t :which-key "Applications")
   "ar" 'ranger
   "ad" 'dired
   ;;"n"  'neotree-toggle
   "s"  'dired-sidebar-toggle-sidebar
   )
  )
(provide 'init-ivy)
;;; init-ivy ends here
