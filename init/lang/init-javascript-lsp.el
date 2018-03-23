;;; init-javascript --- javascript
;;; Commentary:
;;; npm i -g javascript-typescript-langserver
;;; npm uninstall javascript-typescript-langserver -g -S
;;; Code:

;; list packages for javascript
(defvar js-packages
  '(
    lsp-mode
    lsp-ui
    lsp-javascript-typescript
    )
  )

;; fetch the list of packages available
(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package js-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'lsp-mode)
(require 'lsp-javascript-typescript)
(add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
(add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
(add-hook 'js3-mode-hook #'lsp-javascript-typescript-enable) ;; for js3-mode support
(add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support
(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'lsp-javascript-typescript-mode-hook 'flycheck-mode)

(provide 'init-javascript)
;;; init-javascript.el ends here
