;;; init-python --- elpy python
;;; Commentary:
;;; https://github.com/jorgenschaefer/elpy
;;; https://github.com/porterjamesj/virtualenvwrapper.el
;;; Code:
;;; pip install jedi flake8 autopep8 black yapf
;;; 1. pyvenv-workon
;;; 2. open .py file

;;; defer elpy loading:
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )

(provide 'init-python)
;;; init-python.el ends here
