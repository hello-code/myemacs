;;; init-qml --- golang
;;; Commentary:

;;; Code:

;; list packages for qml
(defvar qml-packages
  '(qml-mode
    company
    company-qml))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package qml-packages)
  (unless (package-installed-p package)
    (package-install package)))

(with-eval-after-load 'qml-mode
  (with-eval-after-load 'company
    (add-hook 'qml-mode-hook '(lambda()
			   (set (make-local-variable 'company-backends)'(company-qml))
			   (company-mode)))))

(provide 'init-qml)
;;; init-qml.el ends here
