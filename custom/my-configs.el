;;; my-configs --- custom configs
;;; Commentary:
;;; Code:

;; system coding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)

(setq debug-on-error t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; turn off sound alarms
(setq ring-bell-function 'ignore)

;; disable welcome page
(setq inhibit-startup-message t)

;; frame size
(setq initial-frame-alist '((top . 30) (left . 500) (width . 80) (height . 30)))

;; line number
(setq linum-format " %d ")

(set-mouse-color "white")
(set-cursor-color "white")

;; mouse wheel speed
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)

(global-hl-line-mode t)
;(set-face-background 'highlight "#454545") ;;#454545  dark green
;(set-face-foreground 'highlight nil)
;(set-face-underline 'highlight nil)

;; use space instead of tabs
;; If you really do that -- 'C-q <tab>' does the trick.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; autocomplete pair
(electric-pair-mode t)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; file size
(size-indication-mode t)

;; show file path in frame title
(setq frame-title-format
      '((:eval (if(buffer-file-name)
                   (abbreviate-file-name(buffer-file-name))
                 "%b"))))
;; ignore file name case
(setq read-file-name-completion-ignore-case t)

;; move current line up/down
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(M-up)] 'move-line-up)
(global-set-key [(M-down)] 'move-line-down)

;; over 80 characters
(defun over80characters()
  "highlight over 80 characters."
  (require 'whitespace)
  (setq whitespace-line-column 80)
  (setq whitespace-style '(face lines-tail))
  ;;(custom-set-faces '(whitespace-line((t (:foreground "red" :background "yellow")))))
  ;;(global-whitespace-mode 1)
  (whitespace-mode 1)
  ;;; disable whitespace mode in erc-mode
  ;;(setq whitespace-global-modes '(not erc-mode org-mode))
  )

;; erc config
;; replace prompt to buffer name
(setq erc-prompt (lambda() (concat (buffer-name) ">")))

;; set specific browser to open links
;;(setq browse-url-browser-function 'browse-url-chrome)
(setq browse-url-browser-function 'browse-url-default-browser)

;; add custom yasnippets dir in default dir
(setq yas-snippet-dirs '("~/myemacs/snippets" yas-installed-snippets-dir))

;;; open file in browser
(defun open-in-browser()
  "Open current buffer in browser."
  (interactive)
  (if (buffer-file-name)
      (let ((filename (buffer-file-name)))
        (if (eq system-type 'windows-nt)
            ;;(shell-command (concat "start firefox.exe \"file://" filename "\"")))))
            (shell-command (concat "start chrome.exe \"file://" filename "\""))
          (browse-url filename)))))

(global-set-key (kbd "C-x w") 'open-in-browser)

;; show line number/over80characters in programming modes
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'over80characters)

;; fonts
(cond
 ((eq system-type 'windows-nt)
  (set-frame-font "Consolas-11")
  (set-fontset-font "fontset-default" 'unicode "Microsoft Yahei 12")
  (add-to-list 'default-frame-alist '(font . "Consolas-11"))
  )
 ((eq system-type 'gnu/linux)
  (set-frame-font "DejaVu Sans Mono-11") ;; 10.5
  (set-fontset-font "fontset-default" 'unicode "Noto Sans CJK SC")
  ;;(set-fontset-font "fontset-default" 'unicode "WenQuanYi Bitmap Song 11")
  (setq face-font-rescale-alist '(("Noto Sans CJK SC" . 1.18)))
  (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
  ))

;; mouse wheel font size
(cond
 ((eq system-type 'gnu/linux)
  (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
  (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
  )
 ((eq system-type 'windows-nt)
  (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
  (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease))
 )

;; close all buffer except current buffer
(defun kill-other-buffer()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer)(buffer-list))))

(setq backup-by-copying t ;; 自动备份
      backup-directory-alist '(("." . "~/.saves")) ;; 自动备份在目录"~/.saves"下
      delete-old-versions t ;; 自动删除旧的备份文件
      kept-new-versions 6 ;; 保留最近的6个备份文件
      kept-old-versions 2 ;; 保留最早的2个备份文件
      version-control t) ;; 多次备份

;; 与系统共享剪贴板
(setq select-enable-clipboard t)

;; binding f5 for eval last sexp
;; C-x C-e (eval-last-sexp)
(defun my-lisp-mode-hook()
  (local-set-key (kbd "<f5>") 'eval-last-sexp))
(add-hook 'lisp-mode-hook 'my-lisp-mode-hook)
(add-hook 'lisp-interaction-mode-hook 'my-lisp-mode-hook)

(provide 'my-configs)
;;; my-configs.el ends here
