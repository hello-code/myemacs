;;; init-fci-mode --- fill-column-indicator
;;; Commentary:
;;; https://github.com/alpaker/Fill-Column-Indicator
;;; Code:

(maybe-require-package 'fill-column-indicator)

;;https://github.com/alpaker/Fill-Column-Indicator/issues/54
(defun on-off-fci-before-company(command)
  (when (string= "show" command)
    (turn-off-fci-mode))
  (when (string= "hide" command)
    (turn-on-fci-mode)))

(advice-add 'company-call-frontends :before #'on-off-fci-before-company)

;;(setq fci-handle-truncate-lines nil)
(add-hook 'prog-mode-hook 'fci-mode)

(provide 'init-fci-mode)
;;; init-fci-mode.el ends here
