;;; my-mode-line --- custom mode line
;;; Commentary:
;;; Code:

(setq-default mode-line-position
              '((-3 "%p")(size-indication-mode("("(-4 "%I")")"))
                " "
                (line-number-mode ("%l" (column-number-mode ":%c")))
                ))

(custom-set-faces
 '(mode-line
   ((t (:background "#1c1f26" :foreground "#ffffff" :box (:line-width 1 :color "#4b82f0")))))
 '(mode-line-inactive
   ((t ( :foreground "gray80" :background "gray40" :box '(:line-width 1 :color "#A1B57C" :style nil)))))
 )


(provide 'my-mode-line)
;;; my-mode-line ends here
