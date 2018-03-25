;;; init-company.el --- company
;;; Commentary:
;;; Code:

;; list packages for company
(defvar company-packages
  '(
    company
    company-quickhelp
    diminish
    ))

(my-install-packages company-packages)

(add-hook 'after-init-hook 'global-company-mode)

(with-eval-after-load 'company
  (diminish 'company-mode "CMP")
  (setq company-idle-delay 0.01
        company-show-numbers t
        company-tooltip-limit 10
        company-tooltip-align-annotations t
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-selection-changed t
        company-tooltip-flip-when-above nil
        company-require-match nil
        company-quickhelp-max-lines 60
        pos-tip-border-width 0)

  (define-key company-mode-map (kbd "<C-tab>") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)

  (global-set-key (kbd "<C-tab>") 'company-complete)

  ;; disable company mode in shell mode
  (setq company-global-modes '(not shell-mode))

  (with-eval-after-load 'company-quickhelp
    (add-hook 'after-init-hook 'company-quickhelp-mode))
  )

(provide 'init-company)
;;; init-company.el ends here
