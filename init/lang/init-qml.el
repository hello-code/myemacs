;;; init-qml --- qml
;;; Commentary:

;;; Code:

;; list packages for qml
(defvar qml-packages
  '(qml-mode
    company
    company-qml))

(my-install-packages qml-packages)

(with-eval-after-load 'qml-mode
  (with-eval-after-load 'company
    (add-hook 'qml-mode-hook '(lambda()
			   (set (make-local-variable 'company-backends)'(company-qml))
			   (company-mode)))))

(provide 'init-qml)
;;; init-qml.el ends here
