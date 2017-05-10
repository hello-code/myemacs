;;; init-go --- golang
;;; Commentary:
;;; Code:

;; list packages for golang
(defvar go-packages
  '(
    go-mode
    go-eldoc
    go-dlv
    go-guru
    company
    company-go
    ))

;; fetch the list of packages available
(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package go-packages)
  (unless (package-installed-p package)
    (package-install package)))


;;; go mode hook
(defun my-go-mode-hook()
  (exec-path-from-shell-copy-envs '("GOROOT" "GOPATH"))
  ;; call Gofmt before saving
  ;; use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  
  ;; Godef jump/back key binding.
  ;; jump back buffer :
  ;; |C-t       |'pop-tag-mark   |default
  ;; |----------+----------------|
  ;; |C-x <left>|'previous-buffer|default
  ;;(local-set-key (kbd "<f12>") 'godef-jump-other-window)
  (local-set-key (kbd "<f12>") 'godef-jump)
  (local-set-key (kbd "M-/") 'pop-tag-mark)
  
  ;; removes all unused imports
  (local-set-key (kbd "C-c C-r")'go-remove-unused-imports)
  
  ;; show the go documentation for a given package
  ;; Note: godoc depends on the godoc utility.
  ;; It must be installed and on your $PATH.
  ;; To install it run: go get code.google.com/p/go.tools/cmd/godoc.
  (local-set-key (kbd "C-c C-k") 'godoc)

  ;; show the argument list of the function at your point in the minibuffer
  (go-eldoc-setup)
  ;; go-eldoc
  (set-face-attribute 'eldoc-highlight-function-argument nil
                      :underline t :foreground "orange"
                      :weight 'bold)

  ;; golang debuger
  (require 'go-dlv)
  (local-set-key (kbd "<f5>")'gud-cont)
  (local-set-key (kbd "<f9>") 'gud-break)
  (local-set-key (kbd "<f10>") 'gud-next)
  (local-set-key (kbd "<f11>")'gud-step)
  
  ;; 在go文件中：M-x dlv
  ;; 1. f9
  ;; 2. f5
  ;; 3. f11 单步 step
  ;; 4. 在gud-debug 界面中按 r 开始新一轮调试。若需更改断点则先清除断点再f9,然后重复2,3步。
  ;; 清除单个断点：clear 断点序号（如1,2,3等数字）
  ;; 清除所有断点：clearall

  (require 'go-guru)
  (go-guru-hl-identifier-mode)
  (custom-set-variables '(go-guru-hl-identifier-idle-time 0.2))
  (custom-set-faces '(go-guru-hl-identifier-face ((t (:background "chartreuse" :foreground "black")))))
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)

(with-eval-after-load 'go-mode
  (with-eval-after-load 'company
    (add-hook 'go-mode-hook
              '(lambda()
                 (set(make-local-variable 'company-backends)
                     '(company-go))(company-mode)))
    )
  )

(provide 'init-go)
;;; init-go.el ends here
