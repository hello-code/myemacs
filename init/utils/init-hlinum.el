;;; init-hlinum --- highlight line number
;;; Commentary:
;;; Code:

(maybe-require-package 'hlinum)

(require 'hlinum)
(hlinum-activate)

(with-eval-after-load 'hlinum
  (setq linum-highlight-in-all-buffersp t)
  (custom-set-faces
   '(linum-highlight-face ((t (:background "#37474f" :foreground "orange" :weight bold))))))

(provide 'init-hlinum)
;;; init-hlinum.el ends here
