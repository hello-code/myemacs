;;; init-company.el --- company
;;; Commentary:
;;; Code:

(use-package company
  ;;:defer t
  :ensure t
  :diminish (company-mode . "CMP")
  :init  (add-hook 'after-init-hook 'global-company-mode)
  :config  
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
        company-transformers '(company-sort-by-occurrence) ; weight by frequency
        )
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
  :custom-face
  (company-tooltip ((t (:background "#3c3c3c" :foreground "white"))))
  )

(use-package company-quickhelp
  ;; :ensure t
  ;; :config
  ;; (setq  company-quickhelp-max-lines 60
  ;;        company-quickhelp-delay 0.2
  ;;        company-quickhelp-color-background "#3c3c3c"
  ;;        company-quickhelp-color-foreground "white")
  ;; (define-key company-active-map (kbd "M-h") #'company-quickhelp-manual-begin)

  :after company
  :bind (:map company-active-map
              ("C-c ?" . company-quickhelp-manual-begin)))

(provide 'init-company)
;;; init-company.el ends here
