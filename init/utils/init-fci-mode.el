;;; init-fci-mode --- fill-column-indicator
;;; Commentary:
;;; https://github.com/alpaker/Fill-Column-Indicator
;;; Code:

(use-package fill-column-indicator
  :ensure t
  :defer 3
  :config
  ;;https://github.com/alpaker/Fill-Column-Indicator/issues/54
  (defun on-off-fci-before-company(command)
    (when (string= "show" command)
      (turn-off-fci-mode))
    (when (string= "hide" command)
      (turn-on-fci-mode)))
  (add-hook 'prog-mode-hook 'fci-mode)
  ;; :if (featurep 'company
  ;;               (advice-add 'company-call-frontends :before #'on-off-fci-before-company))
  )

(provide 'init-fci-mode)
;;; init-fci-mode.el ends here
