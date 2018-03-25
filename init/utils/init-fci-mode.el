;;; init-fci-mode --- fill-column-indicator
;;; Commentary:
;;; https://github.com/alpaker/Fill-Column-Indicator
;;; Code:

(maybe-require-package 'fill-column-indicator)

(add-hook 'prog-mode-hook 'fci-mode)

(provide 'init-fci-mode)
;;; init-fci-mode.el ends here
