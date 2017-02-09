;;; init-ace --- jump to
;;; Commentary:
;;; Code:

(require 'package)

(defvar ace-packages
  '(
    ace-window
    ace-jump-mode
    ))

(dolist (package ace-packages)
(unless (package-installed-p package)
  (package-install package)))

(require 'ace-window)

(provide 'init-ace)
;;; init-ace.el ends here
