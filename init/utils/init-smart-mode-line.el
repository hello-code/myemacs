;;; init-smart-mode-line.el --- smart-mode-line
;;; Commentary:
;;; https://github.com/Malabarba/smart-mode-line/
;;; Code:

(require 'package)

(unless (package-installed-p 'smart-mode-line)
  (package-refresh-contents)
  (package-install 'smart-mode-line)
  )

(setq sml/no-confirm-load-theme t)
(sml/setup)

(provide 'init-smart-mode-line)
;;; init-smart-mode-line ends here
