;;; my-mode-line.el --- mode line
;;; Commentary:
;;; Code:

;; Mode line settings
;; use setq-default to set it for /all/ modes

(setq-default mode-line-format
              (list
               ;; ;; day and time
               ;; '(:eval (propertize (format-time-string " %b %d %H:%M ")
               ;;                     'face 'font-lock-builtin-face))

               " "
               ;; '(:eval (propertize (substring vc-mode 5)
               ;;                     'face 'font-lock-comment-face))

               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize " %b "
                                   'face
                                   (let ((face (buffer-modified-p)))
                                     (if face 'font-lock-warning-face
                                       'font-lock-type-face))
                                   'help-echo (buffer-file-name)))

               ;; line and column
               " (" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02l" 'face 'font-lock-keyword-face) ","
               (propertize "%02c" 'face 'font-lock-keyword-face)
               ") "

               ;; relative position, size of file
               " ["
               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-constant-face) ;; size
               "] "

               ;; spaces to align right
               '(:eval (propertize
                        " " 'display
                        `((space :align-to (- (+ right right-fringe right-margin)
                                              ,(+ 3 (string-width mode-name)))))))

               ;; the current major mode
               (propertize " %m " 'face 'font-lock-string-face)
               minor-mode-alist
               ))

(custom-set-faces
 '(mode-line
   ((t (:background "#1a1a1a" :foreground "white" :height 1.1 :box (:line-width 1 :color "#353644")))))
 '(mode-line-inactive
   ((t ( :background "#565063" :foreground "white" :box (:line-width 1 :color "#565063" :style nil)))))
 ;; 文件名
 ;; '(mode-line-buffer-id ((t (:foreground "#ffe4b5" :background "black" :weight bold))))
 )

(provide 'my-mode-line)
;;; my-mode-line.el ends here
