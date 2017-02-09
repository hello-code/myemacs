;;; init-window-numbering --- Numbered window shortcuts
;;; Commentary:
;;; Code:

(window-numbering-mode 1)
(defface window-numbering-face
  '((default :foreground "red" :weight bold 
	;;:box '(:line-width 1)
))
  "Face for window number in the mode-line.")

(provide 'init-window-numbering)
;;; init-window-numbering.el ends here