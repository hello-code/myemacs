;;; init-smooth-scrolling --- smooth scrolling
;;; Commentary:
;;; Code:

(maybe-require-package 'smooth-scrolling)

(smooth-scrolling-mode 1)

(with-eval-after-load 'smooth-scrolling
  (setq smooth-scroll-margin 3))

(provide 'init-smooth-scrolling)
;;; init-smooth-scrolling.el ends here
