;;; my-org.el --- custom org configuration
;;; Commentary:
;;; Code:

(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files (quote ("~/git/org")))

;; 只在org模式中绑定该快捷键


(provide 'my-org)
;;; my-org ends here
