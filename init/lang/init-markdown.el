;;; init-markdown.el --- markdown
;;; Commentary:
;;; Code:

(defvar md-packages
  '(
    markdown-mode
    ))

(require 'package)
(dolist (package md-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(provide 'init-markdown)
;;; init-markdown ends here
