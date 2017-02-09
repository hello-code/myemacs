;;; init-highlight-symbol.el --- 高亮同名符号
;;; Commentary:
;;https://github.com/nschum/highlight-symbol.el

;;; Code:

(require 'highlight-symbol)

(setq highlight-symbol-idle-delay 0.2)

;; 只有1个时不高亮
(setq highlight-symbol-highlight-single-occurrence nil)

(setq highlight-symbol-foreground-color "red")

;; 颜色
(custom-set-faces
 '(highlight-symbol-face ((t (:background "gray30" :inverse-video t)))))

(provide 'init-highlight-symbol)
;;; init-highlight-symbol.el ends here
