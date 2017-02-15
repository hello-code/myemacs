;;; init-company.el --- company
;;; Commentary:
;;; Code:

;; list packages for company
(defvar company-packages
  '(
    company
    company-quickhelp
    ))

;; fetch the list of packages available
(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package company-packages)
  (unless (package-installed-p package)
    (package-install package)))

  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (setq
     ;;company-tooltip-limit 20 ; bigger popup window
     company-idle-delay .2;菜单延迟
     company-minimum-prefix-length 1; 开始补全字数
     company-echo-delay 0 ; remove annoying blinking
     company-begin-commands '(self-insert-command) ; start autocompletion only after typing
     company-require-match nil
     ;;company-dabbrev-ignore-case nil
     ;;company-dabbrev-downcase nil
     company-show-numbers t; 显示序号
     company-transformers '(company-sort-by-backend-importance)
     company-continue-commands '(not helm-dabbrev)
     )

    (define-key company-mode-map (kbd "<C-tab>") 'company-complete)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (global-set-key (kbd "<C-tab>") 'company-complete);手工补全热键
    
    (company-quickhelp-mode 1)
    (setq company-quickhelp-delay 0.2)
    )

(provide 'init-company)
;;; init-company ends here
