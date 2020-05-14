;;; init-doom-theme.el --- theme
;;; Commentary:
;;; Code:

;;(use-package dracula-theme
;;  :ensure t
;;  :init
;;  (load-theme 'dracula t)
;;  )

(use-package doom-themes
  ;;:defer t
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t     ; if nil, bold is universally disabled
        doom-themes-enable-italic t   ; if nil, italics is universally disabled
        ;;doom-themes-padded-modeline 1
        doom-neotree-file-icons t
        doom-one-brighter-modeline t)

  ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
  ;; may have their own settings.
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;;(doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  )

(provide 'init-doom-themes)
;;; init-doom-themes ends here
