;;; init-fold-this.el --- 折叠
;;; Commentary:
;;; Code:

(maybe-require-package 'fold-this)

(require 'fold-this)

;; (global-set-key (kbd "C-c C-f") 'fold-this)
;; (global-set-key (kbd "C-c C-F") 'fold-this-all)
;; (global-set-key (kbd "C-c C-s") 'fold-this-unfold-all)

(custom-set-faces
 '(fold-this-overlay ((t (:box (:line-width 1 :color "grey75" ))))))

(with-eval-after-load 'evil
  (define-key evil-normal-state-map "zf" 'fold-this)
  (define-key evil-normal-state-map "zF" 'fold-this-all)
  (define-key evil-normal-state-map "zd" 'fold-this-unfold-at-point)
  (define-key evil-normal-state-map "zD" 'fold-this-unfold-all)
  )

(provide 'init-fold-this)
;;; init-fold-this ends here
