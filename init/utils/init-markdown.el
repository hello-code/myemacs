;;; init-markdown.el --- markdown mode
;;; Commentary:
;;; https://github.com/jrblevin/markdown-mode
;;; Code:

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
;;; init-markdown ends here
