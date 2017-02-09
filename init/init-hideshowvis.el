;;; init-hideshowvis.el --- 代码折叠
;;; Commentary:
;;; Code:

;;(require 'hideshowvis)
(hideshowvis-symbols)

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)

(dolist (hook (list
               'emacs-lisp-mode-hook
               'c++-mode-hook
               'js2-mode-hook
               'go-mode-hook
               'python-mode-hook))
  (add-hook hook 'hideshowvis-enable))

;;change -/+ to ▼/▶
;; (define-fringe-bitmap 'hideshowvis-hideable-marker [0 0 254 124 56 16 0 0])
;; (define-fringe-bitmap 'hs-marker [0 32 48 56 60 56 48 32])

(custom-set-faces
 '(hs-fringe-face ((t (:foreground "orange"))))
 '(hs-face ((t (:foreground "orange" :box t))))
 '(hideshowvis-hidable-face ((t (:foreground "gray"))))
 )

(provide 'init-hideshowvis)
;;; init-hideshowvis ends here