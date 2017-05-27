;;; init-evil.el --- evil
;;; Commentary:
;; evil-leader -- https://github.com/cofi/evil-leader
;; ace-jump-mode -- https://github.com/winterTTr/ace-jump-mode
;;; Code:

(defvar evil-packages
  '(
    evil-leader
    evil
    ace-jump-mode
    ))

(require 'package)
(dolist (package evil-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(add-hook 'after-init-hook (lambda()
                             (evil-mode 1)
                             (global-evil-leader-mode t)))

(with-eval-after-load 'evil-leader
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
   "jw" 'ace-jump-word-mode
   "jc" 'ace-jump-char-mode
   "jl" 'ace-jump-line-mode

   "hh" 'highlight-symbol-mode
   "hs" 'highlight-symbol
   "hn" 'highlight-symbol-next

   "w" 'ace-window
   "y" 'yas-global-mode
   "n" 'neotree-toggle
   "p" 'neotree-project-dir-toggle
   )
  )

(provide 'init-evil)
;;; init-evil ends here
