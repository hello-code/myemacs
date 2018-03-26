;;; init-rainbow --- rainbow
;;; Commentary:
;;; Code:

(defvar rainbow-packages
  '(
    rainbow-mode
    rainbow-delimiters
    )
  )

(my-install-packages rainbow-packages)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'init-rainbow)
;;; init-rainbow.el ends here
