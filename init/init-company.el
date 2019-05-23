;;; init-company.el --- company
;;; Commentary:
;;; Code:

(use-package company
  ;;:defer t
  :ensure t
  :diminish (company-mode . "CMP")
  :bind (("M-/" . company-complete)
         ("<backtab>" . company-select-previous)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . company-select-previous)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :hook (after-init . global-company-mode)
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
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil
        pos-tip-border-width 1
	    company-global-modes '(not shell-mode eshell-mode)
        company-transformers '(company-sort-by-occurrence) ; weight by frequency
        )
  :custom-face
  (company-tooltip ((t (:background "#3c3c3c" :foreground "white"))))
  )

(use-package company-quickhelp
  :ensure t
  ;; :defines company-quickhelp-delay
  :after (company)
  :bind (:map company-active-map
              ("M-." . company-quickhelp-manual-begin))
  ;; :hook (global-company-mode . company-quickhelp-mode)
  :init
  (setq  company-quickhelp-max-lines 60
         company-quickhelp-delay 0.2
         company-quickhelp-color-background "#3c3c3c"
         company-quickhelp-color-foreground "white")
  )
(provide 'init-company)
;;; init-company.el ends here
