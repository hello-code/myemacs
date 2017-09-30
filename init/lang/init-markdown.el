;;; init-markdown.el --- markdown
;;; Commentary:
;;; Code:

(defvar md-packages
  '(
    markdown-mode
    ))

(require 'package)
(dolist (package md-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))


(provide 'init-markdown)
;;; init-markdown ends here
