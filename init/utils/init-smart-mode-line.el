;;; init-smart-mode-line.el --- smart-mode-line
;;; Commentary:
;;; https://github.com/Malabarba/smart-mode-line/
;;; Code:

(defvar modeline-package '(smart-mode-line smart-mode-line-powerline-theme))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package modeline-package)
  (unless (package-installed-p package)
    (package-install package)))

(setq sml/no-confirm-load-theme t)
(setq sml/theme 'powerline)
(setq sml/shorten-directory t)
(sml/setup)

;; Color the evil tag - colors taken from spaceline
(setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
      evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
      evil-insert-state-tag   (propertize " <I> " 'face '((:background "chartreuse3"    :foreground "black")))
      evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
      evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
      evil-visual-state-tag   (propertize " <V> " 'face '((:background "gray"           :foreground "black")))
      evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))

;;(setq sml/override-theme nil)

(custom-set-faces
 '(mode-line ((t (:background "black" :foreground "white" :box (:line-width 1 :color "#4B82F0")))))
 '(mode-line-inactive ((t (:background "gray40" :box (:line-width 1 :color "#A1B57C"))))))

(provide 'init-smart-mode-line)
;;; init-smart-mode-line.el ends here
