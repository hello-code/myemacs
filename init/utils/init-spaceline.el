;;; init-spaceline.el --- spaceline
;;; Commentary:
;;; https://github.com/TheBB/spaceline
;;; Code:

(defvar modeline-package
  '(spaceline
    all-the-icons
    spaceline-all-the-icons
    winum
    ))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package modeline-package)
  (unless (package-installed-p package)
    (package-install package)))

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(spaceline-all-the-icons-theme)

(setq powerline-text-scale-factor 0.9)
(spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line

;;; faces
;; Active faces
;;   spaceline-highlight-face ;; The face that changes the highlighted part
;;   powerline-active1  ;; The face used for the second segment
;;   powerline active2  ;; The face used for the third segment
;;   mode-line  ;; The face used for the middle part of the mode line

;;   ;; Inactive faces
;;   powerline-inactive-1
;;   powerline-inactive-2
;;   mode-line-inactive

(custom-set-faces
 '(powerline-active2 ((t (:background "dim gray" :foreground "#ffffff"))))
 ;;'(spaceline-highlight-face(( t (:background "blue")))) ;; default color is orange
 )

;; https://github.com/domtronn/all-the-icons.el/issues/28
;; (setq inhibit-compacting-font-caches t)

;;; winum configuration
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

(require 'winum)
(setq winum-auto-setup-mode-line nil)

(defun winum-assign-9-to-calculator-8-to-flycheck-errors ()
  (cond
   ((equal (buffer-name) "*Calculator*") 9)
   ((equal (buffer-name) "*Flycheck errors*") 8)))

;(defun winum-assign-0-to-neotree-and ()
 ; (when (string-match-p (buffer-name) ".*\\*NeoTree\\*.*") 10))

(add-to-list 'winum-assign-functions #'winum-assign-9-to-calculator-8-to-flycheck-errors)
;(add-to-list 'winum-assign-functions #'winum-assign-0-to-neotree)

(set-face-attribute 'winum-face nil :weight 'bold)

(setq window-numbering-scope            'global
      winum-reverse-frame-list          nil
      winum-auto-assign-0-to-minibuffer t
      winum-assign-func                 'my-winum-assign-func
      ;;winum-auto-setup-mode-line        t
      winum-mode-line-position          1
      winum-ignored-buffers             '(" *which-key*"))

(winum-mode)


(setq spaceline-all-the-icons-icon-set-window-numbering 'square )
;; (setq spaceline-window-numbers-unicode t)
;; (setq spaceline-workspace-numbes-unicode t)

(provide 'init-spaceline)
;;; init-spaceline.el ends here
