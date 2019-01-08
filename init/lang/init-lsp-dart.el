;;; init-lsp-dart --- dart
;;; Commentary:
;;; https://github.com/bradyt/dart-mode
;;; https://github.com/natebosch/dart_language_server
;;; pub global activate dart_language_server
;;; Code:

(use-package dart-mode
  :ensure t
  :mode "\\.dart\\'"
  :config
  (add-hook 'dart-mode-hook 'lsp)
  )

(provide 'init-lsp-dart)
;;; init-lsp-dart.el ends here
