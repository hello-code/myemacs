;;; init-company.el --- company
;;; Commentary:
;;; Code:

(use-package company
  :ensure t
  :diminish (company-mode . "CMP")
  :config  
  (global-company-mode)
  (setq company-idle-delay 0.01
        company-show-numbers t
        company-tooltip-limit 10
        company-tooltip-align-annotations t
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-selection-changed t
        company-tooltip-flip-when-above nil
        company-require-match nil
        pos-tip-border-width 1
	    company-global-modes '(not shell-mode eshell-mode)
	    )
  ;; :bind(
  ;; 	:map company-mode-map
  ;;       ("C-n" . company-select-next)
  ;;       ("C-p" . company-select-previous))
  :custom-face
  (company-tooltip ((t (:background "#3c3c3c" :foreground "white"))))
  )

(use-package company-quickhelp
  :ensure t
  :config
  (setq  company-quickhelp-max-lines 60
         company-quickhelp-delay 0.2
         company-quickhelp-color-background "#3c3c3c"
         company-quickhelp-color-foreground "white")
  (define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)
  )
(provide 'init-company)
;;; init-company.el ends here
