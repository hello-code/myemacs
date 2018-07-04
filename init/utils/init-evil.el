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

(my-install-packages evil-packages)

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

    ;; "ff" 'fold-this
    ;; "fs" 'fold-this-unfold-all

    "p" 'projectile-command-map
    
    ;; 常用快捷键
    
    "a" 'helm-do-ag
    "f" 'flycheck-color-mode-line-mode
    "l" 'helm-locate
    "n" 'neotree-toggle
    "s" 'scroll-restore-mode
    "y" 'yas-global-mode
    "w" 'ace-window
    )
  )

(provide 'init-evil)
;;; init-evil ends here
