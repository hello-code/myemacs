;;; init-javascript --- javascript
;;; Commentary:
;;; https://emacs.stackexchange.com/questions/2376/how-to-use-skewer-mode
;;; Code:

;; list packages for javascript
(defvar js-packages
  '(
    skewer-mode
    js2-mode
    ))

(my-install-packages js-packages)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'web-mode-hook 'skewer-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)


(provide 'init-javascript)
;;; init-javascript.el ends here
