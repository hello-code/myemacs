;;; init-ivy.el --- ivy
;;; Commentary:
;;; https://github.com/abo-abo/swiper
;;; Code:
;; https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
(use-package ivy :ensure t)

(use-package general :ensure t
  :config
  (general-define-key "C-'" 'avy-goto-word-1))

(use-package avy :ensure t
  :commands (avy-goto-word-1))
(provide 'init-ivy)
;;; init-ivy ends here
