;;; init-which-key.el --- which-key
;;; Commentary:
;;; Code:

(require 'which-key)

(which-key-mode)
(which-key-setup-side-window-right-bottom)

(which-key-add-key-based-replacements
  "SPC h" "highlight symble"
  "SPC j" "jump to"
  "C-c !" "flycheck"
  )

(setq which-key-idle-delay 0.1)

(provide 'init-which-key)
;;; init-which-key ends here
