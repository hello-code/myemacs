;;; init-evil.el --- evil
;;; Commentary:
;;; Code:
;; evil-leader -- https://github.com/cofi/evil-leader
;; ace-jump-mode -- https://github.com/winterTTr/ace-jump-mode

;; load evil-leader-mode before load evil-mode.

;; evil
(global-evil-leader-mode t)
(evil-mode 1)

;; evil-leader
(require 'evil-leader)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "jw" 'ace-jump-word-mode
  "jc" 'ace-jump-char-mode
  "jl" 'ace-jump-line-mode
  
  "y" 'yas-global-mode ;; yasnippet
  
  "hh" 'highlight-symbol-mode
  "hs" 'highlight-symbol
  "hn" 'highlight-symbol-next
  "hp" 'highlight-symbol-prev
  "hr" 'highlight-symbol-query-replace
  )


(provide 'init-evil)
;;; init-evil ends here
