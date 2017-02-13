;;; init-ox-reveal -- reveal (ppt)
;;; Commentary:
;;; Code:

(require 'package)
(unless (package-installed-p 'ox-reveal)
  (package-refresh-contents)
  (package-install 'ox-reveal))

(add-hook 'org-mode-hook (lambda()(require 'ox-reveal)))

(provide 'init-ox-reveal)
;;; init-ox-reveal ends here
