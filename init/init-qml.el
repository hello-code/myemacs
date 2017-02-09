;;; init-qml --- golang
;;; Commentary:

;;; Code:

(add-hook 'qml-mode-hook '(lambda()
			   (set (make-local-variable 'company-backends)'(company-qml))
			   (company-mode)))

(provide 'init-qml)
;;; init-qml.el ends here