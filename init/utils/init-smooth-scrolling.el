;;; init-smooth-scrolling --- smooth scrolling
;;; Commentary:
;;; Code:

(use-package smooth-scrolling
  :ensure t
  :defer 3
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 2)
  )

(provide 'init-smooth-scrolling)
;;; init-smooth-scrolling.el ends here
