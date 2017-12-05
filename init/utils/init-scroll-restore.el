;;; init-scroll-restore --- scroll restore
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'scroll-restore)
    (package-refresh-contents)
    (package-install 'scroll-restore))

(require 'scroll-restore)
(scroll-restore-mode 1)

(provide 'init-scroll-restore)
;;; init-scroll-restore.el ends here
