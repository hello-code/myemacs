;;; init-dart --- dart
;;; Commentary:
;;; https://github.com/nex3/dart-mode
;;; https://lupan.pl/dotemacs/
;;; https://github.com/bradyt/dart-mode/issues/35
;;; Code:

(defun my-dart-goto ()
  (interactive)
  (xref-push-marker-stack)
  (dart-goto))

(use-package dart-mode
  :ensure t
  :mode "\\.dart\\'"
  :after(flycheck)
  :init
  (setq
   dart-debug t
   dart-analysis-server-snapshot-path "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot"
   dart-enable-analysis-server t
   dart-formatter-command-override "/usr/lib/dart/bin/dartfmt"
   dart-format-on-save t
   )
  :bind
  (:map dart-mode-map
        ("M-." . my-dart-goto)
        ("M-/" . dabbrev-expand)
        ("C-i" . company-indent-or-complete-common)
        ("C-M-i" . company-indent-or-complete-common)) 
  :config
  (add-hook 'dart-mode-hook 'flycheck-mode)
  )

(provide 'init-dart)
;;; init-dart.el ends here
