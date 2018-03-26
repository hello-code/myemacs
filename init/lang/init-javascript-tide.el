;;; init-javascript --- javascript
;;; Commentary:
;;; npm install typescript
;;; jsconfig.json :
;; {
;;   "compilerOptions": {
;;     "target": "es2017",
;;     "allowSyntheticDefaultImports": true,
;;     "noEmit": true,
;;     "checkJs": true,
;;     "jsx": "react",

;;     "lib": [ "dom", "es2017" ]
;;   },
;;   "include": [
;;     "./src/"
;;   ]
;; }

;;; Code:

;; list packages for javascript
(defvar js-packages
  '(
    js2-mode
    tide
    jquery-doc
    ))

(my-install-packages js-packages)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; ;; tide
;; (setq tide-format-options
;;       '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
;; (add-hook 'js2-mode-hook 'tide-setup)

;; ;; jquery-doc
;; (with-eval-after-load 'js2-mode
;;   (add-hook 'js2-mode-hook 'jquery-doc-setup))

;; (maybe-require-package 'add-node-modules-path)
;; (with-eval-after-load 'js2-mode
;; (add-hook 'js2-mode-hook 'add-node-modules-path))

;; ;; flycheck
;; (add-hook 'js2-mode-hook
;; 	      #'(lambda ()
;; 	          (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
;; 	          ;(if (member (current-filetype) '("html"))
;; 		         ; (evil-mode -1)
;;                 (flycheck-mode))))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))


(with-eval-after-load 'js2-mode
  (add-hook 'js2-mode-hook #'setup-tide-mode)
  (add-hook 'js2-mode-hook 'jquery-doc-setup)
  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)

  ;; configure javascript-tide checker to run after your default javascript checker
  ;(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  )



(provide 'init-javascript)
;;; init-javascript.el ends here
