;;; init-javascript --- javascript
;;; Commentary:
;;; sudo npm install tern js-beautify eslint -g
;;; npm uninstall tern js-beautify -g -S
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

(use-package js2-mode
  :defer 1
  :ensure t
  :init
  (setq js-basic-indent 2)
  (setq-default js2-basic-indent 2
                js2-basic-offset 2
                js2-auto-indent-p t
                js2-cleanup-whitespace t
                js2-enter-indents-newline t
                js2-indent-on-enter-key t
                js2-global-externs (list "window" "module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "jQuery" "$"))

  (add-hook 'js2-mode-hook
            (lambda ()
              (push '("function" . ?ƒ) prettify-symbols-alist)))
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))

(use-package color-identifiers-mode
  ;;:defer 1
  :ensure t
  :after js2
  :init
  (add-hook 'js2-mode-hook 'color-identifiers-mode))

(use-package tern
  ;; :defer 1
  :ensure t
  :after js2
  :init (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
  :config
  (use-package company-tern
    :ensure t
    :after company
    :init (add-to-list 'company-backends 'company-tern)))

(use-package js2-refactor
  ;;:defer 1
  :ensure t
  :after js2
  :init   (add-hook 'js2-mode-hook 'js2-refactor-mode)
  :config (js2r-add-keybindings-with-prefix "C-c ."))

(provide 'init-javascript)
;;; init-javascript.el ends here
