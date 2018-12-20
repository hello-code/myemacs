;;; init-flyspell --- spell
;;; Commentary:
;;; https://github.com/d12frosted/flyspell-correct
;;; https://github.com/bnbeckwith/writegood-mode
;;; Code:

(use-package flyspell
  :defer t
  :init
  (add-hook 'text-mode-hook 'flyspell-mode)
  ;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'org-mode-hook 'turn-off-flyspell)
  ;;  :bind("M-f" . flyspell-mode)
  :config
  (setq-default ispell-program-name "hunspell")
  )

(use-package flyspell-correct
  :after(flyspell-mode)
  :ensure t
  :bind(:map flyspell-mode-map ("C-;" . #'flyspell-correct-wrapper))
  )

(use-package writegood-mode
  :after(flyspell-mode)
  :ensure t
  :bind("C-c g" . 'writegood-mode))

(provide 'init-flyspell)
;;; init-flyspell.el ends here
