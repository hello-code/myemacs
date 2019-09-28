;;; init-reveal --- ppt
;;; Commentary:
;;; https://opensource.com/article/18/2/how-create-slides-emacs-org-mode-and-revealjs
;;; 1. M-x load-library ox-reveal
;;; 2. C-c C-e 
;;; #+BEGIN_NOTES
;;; Adding Your note here.Press s key
;;; #+END_NOTES
;;; Code:

(use-package ox-reveal
  :defer t
  :ensure t
  :config
  (require 'ox-reveal)
  (setq org-reveal-root "file:///f:/reveal.js")
  )
(provide 'init-reveal)
;;; init-reveal.el ends here
