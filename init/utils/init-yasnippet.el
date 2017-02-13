;;; init-yasnippet --- yasnippet
;;; Commentary:
;;; Code:

(require 'package)

(unless (package-installed-p 'yasnippet)
  (package-refresh-contents)
  (package-install 'yasnippet))

;;(require 'yasnippet)

;;(yas-reload-all)
;;(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-yasnippet)
;;; init-yasnippet ends here
