;;; init-highlight-indent-guides --- highlight-indent-guides mode
;;; Commentary:
;;; https://github.com/DarthFennec/highlight-indent-guides
;;; Code:

(use-package highlight-indent-guides
  :ensure t
  :config
  :hook ((prog-mode . highlight-indent-guides-mode)
         (yaml-mode . highlight-indent-guides-mode))
  :config
  (setq highlight-indent-guides-method 'character)
  )

(provide 'init-highlight-indent-guides)
;;; init-highlight-indent-guides ends here
