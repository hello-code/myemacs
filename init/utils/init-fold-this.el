;;; init-fold-this.el --- 折叠
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'fold-this)
  (package-refresh-contents)
  (package-install 'fold-this)
  )

(global-set-key (kbd "C-c C-f") 'fold-this)
(global-set-key (kbd "C-c C-F") 'fold-this-all)
(global-set-key (kbd "C-c C-s") 'fold-this-unfold-all)

(provide 'init-fold-this)
;;; init-fold-this ends here
