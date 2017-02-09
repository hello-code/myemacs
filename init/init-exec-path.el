;;; init-exec-path.el --- exec-path-from-shell
;;; Commentary:
;;; Code:


(require 'package)

(unless (package-installed-p 'exec-path-from-shell)
    (package-refresh-contents)
    (package-install 'exec-path-from-shell))

(with-eval-after-load 'exec-path-from-shell
    (setq exec-path-from-shell-check-startup-files nil)
    (exec-path-from-shell-initialize)
)

(provide 'init-exec-path)
;;; init-exec-path.el ends here
