;;; init-fold-this.el --- 折叠
;;; Commentary:
;;; Code:

(use-package fold-this
  :ensure t
  :after(evil)
  :config
  (custom-set-faces
   '(fold-this-overlay ((t (:box (:line-width 1 :color "orange" ))))))
  (define-key evil-normal-state-map "zf" 'fold-this)
  (define-key evil-normal-state-map "zF" 'fold-this-all)
  (define-key evil-normal-state-map "zd" 'fold-this-unfold-at-point)
  (define-key evil-normal-state-map "zD" 'fold-this-unfold-all)
  )

(provide 'init-fold-this)
;;; init-fold-this ends here
