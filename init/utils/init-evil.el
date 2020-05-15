;;; init-evil.el --- evil
;;; Commentary:
;;; Code:

(use-package evil
  :ensure t
  :defer 1 
  :diminish (undo-tree-mode . "")
  :config
  (evil-mode)
  (setq evil-mode-line-format '(before . mode-line-front-space))

  ;; 只有<N> <E> <I>... 等有颜色a
  (setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "chartreuse3"    :foreground "black")))
        evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
        evil-insert-state-tag   (propertize " <I> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
        evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
        evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
        evil-visual-state-tag   (propertize " <V> " 'face '((:background "gray"           :foreground "black")))
        evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))

  ;; ;; change whole mode-line color by evil state
  ;; (require 'cl)                         
  ;; (lexical-let ((default-color (cons (face-background 'mode-line)
  ;;                                    (face-foreground 'mode-line))))
  ;;              (add-hook 'post-command-hook
  ;;                        (lambda ()
  ;;                          (let ((color (cond ((minibufferp) default-color)
  ;;                                             ((evil-insert-state-p) '("#ffec8b" . "black"))
  ;;                                             ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
  ;;                                             ;;((buffer-modified-p)   '("#006fa0" . "#ffffff"))
  ;;                                             ((buffer-modified-p)   '("orange" . "black"))
  ;;                                             (t default-color))))
  ;;                            (set-face-background 'mode-line (car color))
  ;;                            (set-face-foreground 'mode-line (cdr color))))))
  )

(provide 'init-evil)
;;; init-evil ends here
