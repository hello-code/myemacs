;;; init-evil.el --- evil
;;; Commentary:
;;; Code:

(use-package evil
  :ensure t
  :defer 1 
  :diminish (undo-tree-mode . "")
  :config
  (evil-mode)
  )

(provide 'init-evil)
;;; init-evil ends here
