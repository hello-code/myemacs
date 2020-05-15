;;; init-doom-theme.el --- theme
;;; Commentary:
;;; Code:
;;; https://github.com/hlissner/emacs-doom-themes

(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-one t)
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t     ; if nil, bold is universally disabled
        doom-themes-enable-italic t)  ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  )

(provide 'init-doom-themes)
;;; init-doom-themes ends here
