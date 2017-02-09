;;; init-evil.el --- evil
;;; Commentary:
;; evil-leader -- https://github.com/cofi/evil-leader
;; ace-jump-mode -- https://github.com/winterTTr/ace-jump-mode
;;; Code:




;; load evil-leader-mode before load evil-mode.

(require-package 'evil-leader)
(require-package 'evil)
(require-package 'ace-jump-mode)

(add-hook 'after-init-hook (lambda()
                             (evil-mode 1)
                             (global-evil-leader-mode t)))

(with-eval-after-load 'evil-leader
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
   "jw" 'ace-jump-word-mode
   "jc" 'ace-jump-char-mode
   "jl" 'ace-jump-line-mode
   )
  )

(provide 'init-evil)
;;; init-evil ends here
