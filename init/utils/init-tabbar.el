;;; init-tabbar.el --- tabbar
;;; Commentary:
;;; https://github.com/dholm/tabbar
;;; Code:

(use-package tabbar
  :ensure t
  :config
  (setq tabbar-use-images nil)
  (custom-set-faces
   '(tabbar-button ((t (:inherit tabbar-default :box (:line-width 1 :color "white" :style released-button)))))
   '(tabbar-default ((t (:inherit default :height 1.2 :family "Fira Code"))))
   '(tabbar-highlight ((t (:background "dim gray"))))
   '(tabbar-modified ((t (:inherit tabbar-default :foreground "green"))))
   '(tabbar-selected ((t (:inherit default :foreground "white" :inverse-video t))))
   '(tabbar-selected-modified ((t (:inherit default :foreground "red"))))
   '(tabbar-separator ((t nil)))
   '(tabbar-unselected ((t (:background "black" :foreground "light gray")))))
  )

(provide 'init-tabbar)
;;; init-tabbar ends here
