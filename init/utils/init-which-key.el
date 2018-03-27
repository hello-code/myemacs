;;; init-which-key.el --- which-key
;;; Commentary:
;;; https://github.com/justbur/emacs-which-key#initial-setup
;;; Code:

(require-package 'which-key)

(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-bottom)
(setq which-key-idle-delay 0.1)
(setq which-key-max-description-length 150)
(setq which-key-prefix-prefix "+ ")
(setq which-key-show-remaining-keys t)

;; 此处应与init-evil.el中的evil-leader对应
(which-key-add-key-based-replacements
  "C-c C-a" "markdown-insert"
  "C-c C-c" "markdown"

  "SPC h" "highlight symble"
  "SPC j" "jump to..."
  "SPC p" "projectile"
  "SPC s" "scroll restore"
  "SPC w" "ace window"
  "SPC y" "yasnippet"
  ;;"C-c !" "flycheck"
  )

(provide 'init-which-key)
;;; init-which-key ends here
