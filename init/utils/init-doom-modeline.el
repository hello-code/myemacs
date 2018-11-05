;;; init-doom-modeline.el --- mode line
;;; Commentary:
;;; https://seagle0128.github.io/doom-modeline/
;;; https://github.com/seagle0128/doom-modeline
;;; Code:

;; (use-package doom-modeline
;;   :ensure t
;;   :defer t
;;   :hook (after-init . doom-modeline-init))
(require 'doom-modeline)
(doom-modeline-init)

(use-package all-the-icons
  :ensure t
  :after neotree
  :config
  (setq inhibit-compacting-font-caches t))

(provide 'init-doom-modeline)
;;; init-doom-modeline.el ends here
