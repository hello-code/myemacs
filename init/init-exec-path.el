;;; init-exec-path.el --- exec-path-from-shell
;;; Commentary:
;;; Code:

(require-package 'exec-path-from-shell)

(with-eval-after-load 'exec-path-from-shell
    (setq exec-path-from-shell-check-startup-files nil))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
