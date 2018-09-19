;;; init-spell --- spell
;;; Commentary:
;;; https://github.com/d12frosted/flyspell-correct
;;; https://github.com/bnbeckwith/writegood-mode
;;; Code:

(use-package flyspell-mode
  :hook (text-mode)
  :config
  (setq-default ispell-program-name "hunspell")
  )

(use-package flyspell-correct
  :ensure t
  :after(flyspell-mode)
  :bind(:map flyspell-mode-map ("C-;" . #'flyspell-correct-wrapper))
  )

(use-package writegood-mode
  :ensure t
  :bind("C-c g" . 'writegood-mode))

(provide 'init-spell)
;;; init-spell.el ends here
