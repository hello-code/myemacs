;;; init-winum.el --- winum
;;; Commentary:
;;; Code:

(use-package winum
  :ensure t
  :defer 1
  :init
  (setq winum-keymap
        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "C-`") 'winum-select-window-by-number)
          (define-key map (kbd "C-²") 'winum-select-window-by-number)
          (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
          (define-key map (kbd "M-1") 'winum-select-window-1)
          (define-key map (kbd "M-2") 'winum-select-window-2)
          (define-key map (kbd "M-3") 'winum-select-window-3)
          (define-key map (kbd "M-4") 'winum-select-window-4)
          (define-key map (kbd "M-5") 'winum-select-window-5)
          (define-key map (kbd "M-6") 'winum-select-window-6)
          (define-key map (kbd "M-7") 'winum-select-window-7)
          (define-key map (kbd "M-8") 'winum-select-window-8)
          map))
  :config
  (defun winum-assign-9-to-calculator-8-to-flycheck-errors ()
    "Jump to flycheck errors list after it shown."
    (cond
     ((equal (buffer-name) "*Calculator*") 9)
     ((equal (buffer-name) "*Flycheck errors*") 8)))

  ;;(defun winum-assign-0-to-neotree-and ()
  ;; (when (string-match-p (buffer-name) ".*\\*NeoTree\\*.*") 10))

  (add-to-list 'winum-assign-functions #'winum-assign-9-to-calculator-8-to-flycheck-errors)
  ;;(add-to-list 'winum-assign-functions #'winum-assign-0-to-neotree)

  (set-face-attribute 'winum-face nil
                      :weight 'bold
                      ;;:background "RoyalBlue1"
                      )

  (defvar window-numbering-scope)
  (setq window-numbering-scope           'global
        winum-reverse-frame-list          nil
        winum-auto-assign-0-to-minibuffer t
        ;;winum-assign-functions            'my-winum-assign-func
        ;;winum-auto-setup-mode-line      t
        winum-format                      " [%s] "
        winum-mode-line-position          1
        winum-auto-setup-mode-line        t
        winum-ignored-buffers             '(" *which-key*"))

  (winum-mode)

  ;; (custom-set-faces
  ;;  '(winum-face ((t (:background "gold"
  ;;                                :foreground "black"
  ;;                                :box (:line-width 1 :color "grey75")
  ;;                                :weight bold))) t))
  )
(provide 'init-winum)
;;; init-winum.el ends here
