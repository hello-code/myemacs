;;; init-lsp-dart --- dart
;;; Commentary:
;;; https://github.com/emacs-lsp/lsp-mode
;;; Code:

(use-package lsp-mode :ensure t :defer)

(use-package lsp-ui  :ensure t :after(lsp))

(use-package company-lsp
  :ensure t
  :after(company lsp)
  :config
  (push 'company-lsp company-backends))

(use-package dart-mode
  :ensure t
  :mode "\\.dart\\'"
  :config
  (add-hook 'dart-mode 'flycheck-mode)
  ;; (use-package lsp)
  ;; (use-package lsp-clients)
  (require 'lsp)
  (require 'lsp-clients)
  (setq lsp-prefer-flymake nil)
  (add-hook 'dart-mode-hook 'lsp)
  )

(provide 'init-lsp-dart)
;;; init-lsp-dart.el ends here
