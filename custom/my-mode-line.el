;;; my-mode-line --- custom mode line
;;; Commentary:
;;; Code:

(setq-default mode-line-position
	      '((-3 "%p")(size-indication-mode("/"(-4 "%I")))
		" "
		(line-number-mode ("%l" (column-number-mode ":%c")))
		))

(set-face-attribute 'mode-line nil
		    :foreground "white"
		    :background "black"
		    ;;:box '(:line-width 1 :color "#A1B57C"))
		    :box '(:line-width 1 :color "#4B82F0" :style nil))
(set-face-attribute 'mode-line-inactive nil
		    :foreground "gray80" :background "gray40"
		    :box '(:line-width 1 :color "#A1B57C" :style nil))

(provide 'my-mode-line)
;;; my-mode-line ends here
