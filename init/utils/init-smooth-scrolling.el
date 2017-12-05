;;; init-smooth-scrolling --- smooth scrolling
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'smooth-scrolling)
    (package-refresh-contents)
    (package-install 'smooth-scrolling))

(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 3)

(provide 'init-smooth-scrolling)
;;; init-smooth-scrolling.el ends here
