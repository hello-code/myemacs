;;; init-javascript --- javascript
;;; Commentary:
;;; sudo npm install tern js-beautify eslint -g
;;; put .tern-project file in the same directory.
;;; .tern-project:

;; {
;;      "libs": [
;;      "browser",
;;      "jquery"
;;      ],
;;      "loadEagerly": [
;;      "importantfile.js"
;;      ],
;;      "plugins": {
;;        "requirejs": {
;;        "baseURL": "./",
;;        "paths": {}
;;        }
;;      }
;; }

;;; Code:

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'tern-mode-hook '(lambda()
			   (set (make-local-variable 'company-backends)'(company-tern))
			   (company-mode)))

(add-hook 'js2-mode-hook 'tern-mode)
(add-hook 'js-mode-hook 'tern-mode)

(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)

(eval-after-load "js2-highlight-vars-autoloads"
  '(add-hook 'js2-mode-hook (lambda ()
                              (js2-highlight-vars-mode)
                              )))

;; 加快显示速度
;; 把js2-highlight-vars.el文件中默认的0.5改小一点
;(setq js2--highlight-vars-post-command-timer (run-with-timer 0.5 nil 'js2--do-highlight-vars))

(provide 'init-javascript)
;;; init-javascript.el ends here
