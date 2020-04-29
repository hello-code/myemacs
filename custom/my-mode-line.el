;;; my-mode-line.el --- mode line
;;; Commentary:
;;; Code:

;; Mode line settings
;; use setq-default to set it for /all/ modes
;; https://stackoverflow.com/questions/16985701/change-the-color-of-the-mode-line-depending-on-buffer-state

(defface my-narrow-face
  '((t (:foreground "black" :background "yellow3")))
  "todo/fixme highlighting."
  :group 'faces)

(defface my-read-only-face
  '((t (:foreground "black" :background "orange3")))
  "Read-only buffer highlighting."
  :group 'faces)

(defface my-modified-face
  '((t (:foreground "gray80" :background "red")))
  "Modified buffer highlighting."
  :group 'faces)

(setq-default
 mode-line-format
 '("  "
   (:eval (let ((str (if buffer-read-only
                         (if (buffer-modified-p) "%%*" "%%%%")
                       (if (buffer-modified-p) "**" "--"))))
            (if buffer-read-only
                (propertize str 'face 'my-read-only-face)
              (if (buffer-modified-p)
                  (propertize str 'face 'my-modified-face)
                str))))
   ;;(list 'line-number-mode "  ")
   (:eval (when line-number-mode
            (let ((str "(%l")) 
              (if (/= (buffer-size) (- (point-max) (point-min)))
                  (propertize str 'face 'my-narrow-face)
                str))))
   (list 'column-number-mode ":%c)")
   " [%p/%I]"
   " " mode-line-buffer-identification
   ;;"  %m"
   mode-line-modes
   ))

(custom-set-faces
 '(mode-line((t(
                :box(:line-width 1 :color "#4b82f0")
                :height 1.0
                :font "Fira Code-10"))))
 '(mode-line-inactive((t (
                          :box(:line-width 1 :color "gray" :style nil)
                          :height 1.0
                          :font "Fira Code-10" :foreground "#cdcdc1"))))
 )

(provide 'my-mode-line)
;;; my-mode-line.el ends here
