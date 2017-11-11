;;; init-projectile -- projectile
;;; Commentary:
;;; Code:

(defvar projectile-packages
  '(
    projectile
    ))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package projectile-packages)
  (unless (package-installed-p package)
    (package-install package)))

(projectile-global-mode)

(with-eval-after-load 'projectile
  (setq projectile-enable-caching t)
  )

(provide 'init-projectile)
;;; init-projectile.el ends here
