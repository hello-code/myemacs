;;; init-company.el --- company
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook 'global-company-mode)
(with-eval-after-load
 'company
 (define-key company-mode-map (kbd "<C-tab>") 'company-complete)
 (setq ;company-tooltip-limit 20 ; bigger popup window
	   company-idle-delay .3;菜单延迟
	   company-minimum-prefix-length 1; 开始补全字数
	   company-echo-delay 0 ; remove annoying blinking
	   company-begin-commands '(self-insert-command) ; start autocompletion only after typing
	   company-require-match nil
	   ;;company-dabbrev-ignore-case nil
	   ;;company-dabbrev-downcase nil
	   company-show-numbers t; 显示序号
	   company-transformers '(company-sort-by-backend-importance)
	   company-continue-commands '(not helm-dabbrev))
 ;; 补全菜单选项快捷键
 (define-key company-active-map (kbd "C-n") 'company-select-next)
 (define-key company-active-map (kbd "C-p") 'company-select-previous)
 )

(global-set-key (kbd "<C-tab>") 'company-complete);手工补全热键

(provide 'init-company)
;;; init-company ends here
