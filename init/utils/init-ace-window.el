;;; init-ace-window.el --- window number
;;; Commentary:
;;; delete window: C-u M-o x select you want delete window's number
;;; show command help(aw-show-dispatch-help): C-u M-o ?
;;; Code:

(use-package ace-window
  :ensure t
  :defer 1
  :init
  (global-set-key (kbd "M-o") 'ace-window)
  (ace-window-display-mode)
  :config
  ;; (custom-set-faces '(aw-mode-line-face((t(:box(:line-width 1))))))
  (set-face-attribute
   'aw-leading-char-face nil
   :foreground "deep sky blue"
   :weight 'bold
   :height 3.0)
  (set-face-attribute
   'aw-mode-line-face nil
   :inherit 'mode-line-buffer-id
   :foreground "orange"
   ;;:background "orange"
   ;;:box 1
   )
  (setq
   ;; aw-keys '(?a ?s ?d ?f ?j ?k ?l) ;; default is number 1,2,3
   aw-dispatch-always t
   aw-dispatch-alist
   '((?x aw-delete-window "Ace - Delete Window")
     (?c aw-swap-window "Ace - Swap Window")
     (?n aw-flip-window)
     (?v aw-split-window-vert "Ace - Split Vert Window")
     (?h aw-split-window-horz "Ace - Split Horz Window")
     (?m delete-other-windows "Ace - Maximize Window")
     (?g delete-other-windows)
     (?b balance-windows)
     (?u (lambda ()
           (progn
             (winner-undo)
             (setq this-command 'winner-undo))))
     (?r winner-redo)
     (?? aw-show-dispatch-help)))
  )

(provide 'init-ace-window)
;;; init-ace-window.el ends here
