;;; init-hlinum --- highlight line number
;;; Commentary:
;;; https://github.com/tom-tan/hlinum-mode
;;; Code:

(maybe-require-package 'hlinum)

(require 'hlinum)
(hlinum-activate)

(with-eval-after-load 'hlinum
  (setq linum-highlight-in-all-buffersp t)
  (custom-set-faces
   '(linum-highlight-face ((t (:background "orange" :foreground "black" :weight bold))))))

(provide 'init-hlinum)
;;; init-hlinum.el ends here
