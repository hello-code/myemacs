;;; init-evil.el --- evil
;;; Commentary:
;;; Code:

(use-package evil
  :ensure t
  :diminish (undo-tree-mode . "")
  :config
  (evil-mode)
  )

(provide 'init-evil)
;;; init-evil ends here
