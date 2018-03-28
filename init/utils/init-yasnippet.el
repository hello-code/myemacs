;;; init-yasnippet --- yasnippet
;;; Commentary:
;;; Code:

(maybe-require-package 'yasnippet)
(maybe-require-package 'yasnippet-snippets)

(setq yas-snippet-dirs
      '(yasnippet-snippets-dir
        "~/myemacs/snippets")
      )


;;(yas-reload-all)
;;(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-yasnippet)
;;; init-yasnippet ends here
