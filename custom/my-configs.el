;;; my-configs --- custom configs
;;; Commentary:
;;; Code:

;; theme
(load-theme 'wombat t)

;; system coding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'chinese-gbk)
(prefer-coding-system 'utf-8)

;; turn off sound alarms
(setq ring-bell-function 'ignore)

;; disable welcome page
(setq inhibit-startup-message t)
					;(set-background-color "#101218")
(set-mouse-color "white")
(set-cursor-color "white")

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)

(global-hl-line-mode t)
(set-face-background 'highlight "#454545") ;;#454545  dark green
(set-face-foreground 'highlight nil)
(set-face-underline 'highlight nil)

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
(setq browse-url-browser-function 'browse-url-chrome)

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
  )
 ((eq system-type 'gnu/linux)
  (set-frame-font "DejaVu Sans Mono-11") ;; 10.5
  (set-fontset-font "fontset-default" 'unicode "Noto Sans CJK SC")
  ;;(set-fontset-font "fontset-default" 'unicode "WenQuanYi Bitmap Song 11")
  (setq face-font-rescale-alist '(("Noto Sans CJK SC" . 1.18)))
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

(provide 'my-configs)
;;; my-config ends here