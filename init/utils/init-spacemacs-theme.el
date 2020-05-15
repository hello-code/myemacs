;;; init-spacemacs-theme.el --- theme
;;; Commentary:
;;; Code:

(use-package spacemacs-common
  :ensure spacemacs-theme
  :config(load-theme 'spacemacs-dark t)
  (custom-set-variables '(spacemacs-theme-custom-colors
                          '((act1 . "yellow")
                            (act2 . "blue")
                            (mat . "red")
                            )))
  )
(custom-set-variables '(spacemacs-theme-custom-colors
                        '((act1 . "#ff0000")
                          (act2 . "#0000ff")
                          (base . "red"))))
(provide 'init-spacemacs-theme)
;;; init-spacemacs-theme ends here
