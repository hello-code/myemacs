;;; init-fci-mode --- fill-column-indicator
;;; Commentary:
;;; https://github.com/alpaker/Fill-Column-Indicator
;;; Code:

(maybe-require-package 'fill-column-indicator)

(setq fci-handle-truncate-lines nil)
(add-hook 'prog-mode-hook 'fci-mode)

(provide 'init-fci-mode)
;;; init-fci-mode.el ends here
