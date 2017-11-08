;;; init-fci-mode --- fill-column-indicator
;;; Commentary:
;;; https://github.com/alpaker/Fill-Column-Indicator
;;; Code:

(defvar fci-mode-packages
  '(fill-column-indicator))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package fci-mode-packages)
  (unless (package-installed-p package)
    (package-install package)))

(add-hook 'prog-mode-hook 'fci-mode)

(provide 'init-fci-mode)
;;; init-fci-mode.el ends here
