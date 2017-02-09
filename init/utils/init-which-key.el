;;; init-which-key.el --- which-key
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'which-key)
  (package-refresh-contents)
  (package-install 'which-key)
  )

(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-right-bottom)
(setq which-key-idle-delay 0.1)

;; 此处应与init-evil.el中的evil-leader对应
(which-key-add-key-based-replacements
  "SPC j" "jump to..."
  "SPC h" "highlight symble"
  "SPC x" "xxx"
  "C-c !" "flycheck"
  "SPC w" "ace window"
  )

(provide 'init-which-key)
;;; init-which-key ends here
