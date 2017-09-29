;;; init-highlight-symbol.el --- 高亮同名符号
;;; Commentary:
;;https://github.com/nschum/highlight-symbol.el

;;; Code:

(require 'package)

(unless (package-installed-p 'highlight-symbol)
  (package-install 'highlight-symbol))

(require 'highlight-symbol)
(with-eval-after-load 'highlight-symbol
  (setq highlight-symbol-idle-delay 0.2)
  (setq highlight-symbol-highlight-single-occurrence nil)
  (setq highlight-symbol-foreground-color "black")
  (custom-set-faces
   '(highlight-symbol-face ((t (:background "gray30" :inverse-video t)))))
  )

(provide 'init-highlight-symbol)
;;; init-highlight-symbol.el ends here
