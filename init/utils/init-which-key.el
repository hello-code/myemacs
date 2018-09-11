;;; init-which-key.el --- which-key
;;; Commentary:
;;; https://github.com/justbur/emacs-which-key#initial-setup
;;; Code:

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-idle-delay 0.05
        which-key-max-description-length 150
        which-key-show-remaining-keys t)
  (which-key-add-key-based-replacements
    "C-c f" "file"
    "C-c ff" "find file"
    "C-c fr" "recently edited"
    "C-c p" "project")
  :diminish (which-key-mode . "") ;; not working
  )

(provide 'init-which-key)
;;; init-which-key ends here
