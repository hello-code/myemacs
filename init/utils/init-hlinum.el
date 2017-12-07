;;; init-hlinum --- highlight line number
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'hlinum)
  (package-refresh-contents)
  (package-install 'hlinum))

;(require 'hlinum)
(hlinum-activate)

(provide 'init-hlinum)
;;; init-hlinum.el ends here
