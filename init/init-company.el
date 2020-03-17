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

;; (use-package company-box
;;   :ensure t
;;   :hook (company-mode . company-box-mode)
;;   :config
;;   (setq company-box-icons-alist 'company-box-icons-all-the-icons)
;;   (setq company-box-icons-all-the-icons
;;         `((Unknown . ,(all-the-icons-material "find_in_page" :height 0.85 :v-adjust -0.2))
;;           (Text . ,(all-the-icons-faicon "text-width" :height 0.8 :v-adjust -0.05))
;;           (Method . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
;;           (Function . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
;;           (Constructor . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
;;           (Field . ,(all-the-icons-octicon "tag" :height 0.8 :v-adjust 0 :face 'all-the-icons-lblue))
;;           (Variable . ,(all-the-icons-octicon "tag" :height 0.8 :v-adjust 0 :face 'all-the-icons-lblue))
;;           (Class . ,(all-the-icons-material "settings_input_component" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
;;           (Interface . ,(all-the-icons-material "share" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
;;           (Module . ,(all-the-icons-material "view_module" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
;;           (Property . ,(all-the-icons-faicon "wrench" :height 0.8 :v-adjust -0.05))
;;           (Unit . ,(all-the-icons-material "settings_system_daydream" :height 0.85 :v-adjust -0.2))
;;           (Value . ,(all-the-icons-material "format_align_right" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
;;           (Enum . ,(all-the-icons-material "storage" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
;;           (Keyword . ,(all-the-icons-material "filter_center_focus" :height 0.85 :v-adjust -0.2))
;;           (Snippet . ,(all-the-icons-material "format_align_center" :height 0.85 :v-adjust -0.2))
;;           (Color . ,(all-the-icons-material "palette" :height 0.85 :v-adjust -0.2))
;;           (File . ,(all-the-icons-faicon "file-o" :height 0.85 :v-adjust -0.05))
;;           (Reference . ,(all-the-icons-material "collections_bookmark" :height 0.85 :v-adjust -0.2))
;;           (Folder . ,(all-the-icons-faicon "folder-open" :height 0.85 :v-adjust -0.05))
;;           (EnumMember . ,(all-the-icons-material "format_align_right" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
;;           (Constant . ,(all-the-icons-faicon "square-o" :height 0.85 :v-adjust -0.1))
;;           (Struct . ,(all-the-icons-material "settings_input_component" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
;;           (Event . ,(all-the-icons-octicon "zap" :height 0.8 :v-adjust 0 :face 'all-the-icons-orange))
;;           (Operator . ,(all-the-icons-material "control_point" :height 0.85 :v-adjust -0.2))
;;           (TypeParameter . ,(all-the-icons-faicon "arrows" :height 0.8 :v-adjust -0.05))
;;           (Template . ,(all-the-icons-material "format_align_left" :height 0.85 :v-adjust -0.2)))
;;         company-box-icons-alist 'company-box-icons-all-the-icons)
;;   )


(provide 'init-company)
;;; init-company.el ends here
