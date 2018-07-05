;;; my-mode-line --- custom mode line
;;; Commentary:
;;; Code:

(setq-default mode-line-position
              '((-3 "%p")(size-indication-mode("("(-4 "%I")")"))
                " "
                (line-number-mode ("%l" (column-number-mode ":%c")))
                ))

;;(set-face-attribute 'modeline-buffer-id nil :foreground "orange")

(custom-set-faces
 '(mode-line
   ;;((t (:background "#1c1f26" :foreground "#ffffff" :box (:line-width 1 :color "#4b82f0")))))
   ((t (:background "#1c1f26" :foreground "#ffffff" :box (:line-width 1 :color "dark gray")))))
 '(mode-line-inactive
   ((t ( :foreground "gray80" :background "gray40" :box '(:line-width 1 :color "#A1B57C" :style nil)))))
 '(mode-line-buffer-id ((t (:foreground "red" :weight bold))))
 )

;; ;; 只有<N> <E> <I>... 等有颜色a
;; (setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
;;       evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
;;       evil-insert-state-tag   (propertize " <I> " 'face '((:background "chartreuse3"    :foreground "black")))
;;       evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
;;       evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
;;       evil-visual-state-tag   (propertize " <V> " 'face '((:background "gray"           :foreground "black")))
;;       evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))

;;; 整个mode line都有颜色
(with-eval-after-load 'evil
  (require 'cl)
  ;; change mode-line color by evil state
  (lexical-let ((default-color (cons (face-background 'mode-line)
                                     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
              (lambda ()
                (let ((color (cond ((minibufferp) default-color)
                                   ((evil-insert-state-p) '("#ffec8b" . "black"))
                                   ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                   ;;((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                   ((buffer-modified-p)   '("orange" . "black"))
                                   (t default-color))))
                  (set-face-background 'mode-line (car color))
                  (set-face-foreground 'mode-line (cdr color)))))))

(provide 'my-mode-line)
;;; my-mode-line ends here
