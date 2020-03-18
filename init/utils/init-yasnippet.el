;; init-yasnippet --- yasnippet
;;; Commentary:
;;; Code:

(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (
         (go-mode . yas-minor-mode)
         (python-mode . yas-minor-mode))
  :config
  (setq yas-snippet-dirs
        '(yas-snippets-dir
          "~/myemacs/snippets")
        ))

(provide 'init-yasnippet)
;;; init-yasnippet ends here
