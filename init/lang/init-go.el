;;; init-go --- golang
;;; Commentary:
;;; Code:

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  ;;:interpreter "go"
  ;;:defer 1 ;; don't defer
  :bind(:map go-mode-map
             ;; Godef jump/back key binding.
             ;; jump back buffer :
             ;; |C-t       |'pop-tag-mark   |default
             ;; |----------+----------------|
             ;; |C-x <left>|'previous-buffer|default
             ([f12] . godef-jump)
             ([S-f12] . pop-tag-mark)
             ("M-." . godef-jump)
             ("M-," . pop-tag-mark))
  :config
  ;;Don't call exec-path-from-shell function on windows."
  (cond ((not(eq system-type 'windows-nt))
         (exec-path-from-shell-copy-envs '("GOROOT" "GOPATH"))))

  ;; call Gofmt before saving
  ;; use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(use-package go-eldoc :ensure t
  :defer 1
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (set-face-attribute 'eldoc-highlight-function-argument nil
                      :underline t :foreground "orange"
                      :weight 'bold)
  )

;; golang debuger
(use-package go-dlv
  :ensure t
  ;; :defer 1 ;; don't defer
  :bind(:map go-mode-map
             ([f5] . gud-cont)
             ([f9] . gud-break)
             ([f10] . gud-next)
             ([f11] . gud-step)
             ;; go get -u github.com/derekparker/delve/cmd/dlv
             ;; 在go文件中：M-x dlv
             ;; 1. f9
             ;; 2. f5
             ;; 3. f11 单步 step
             ;; 4. 在gud-debug 界面中按 r 开始新一轮调试。若需更改断点则先清除断点再f9,然后重复2,3步。
             ;; 清除单个断点：clear 断点序号（如1,2,3等数字）
             ;; 清除所有断点：clearall
             )
  :config
  (add-hook 'go-mode-hook 'go-dlv))

(use-package go-guru
  :ensure t
  :defer 1
  :config
  (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
  ;; (custom-set-variables '(go-guru-hl-identifier-idle-time 0.2))
  ;; (custom-set-faces '(go-guru-hl-identifier-face ((t (:background "chartreuse" :foreground "black")))))
  )

(use-package company-go
  :ensure t
  :defer 1
  :after(go-mode company)
  :config
  (add-hook 'go-mode-hook
            '(lambda()
               (set(make-local-variable 'company-backends)
                   '(company-go))(company-mode)))
  )

(provide 'init-go)
;;; init-go.el ends here
