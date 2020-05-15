;;; init-doom-modeline.el --- mode line
;;; Commentary:
;;; https://seagle0128.github.io/doom-modeline/
;;; https://github.com/seagle0128/doom-modeline
;;; Code:

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-init)
  :init
  (setq doom-modeline-height 1)
  (set-face-attribute 'mode-line nil :family "Noto Sans" :height 95)
  (set-face-attribute 'mode-line-inactive nil :family "Noto Sans" :height 95)
  (setq doom-modeline-bar-width 0)
  :config
  (custom-set-faces
   '(mode-line((t (:box(:line-width 1 :color "#4b82f0")))))
   '(mode-line-inactive((t (:box(:line-width 1 :color "gray" :style nil)))))
   )
  )

(defun my-doom-modeline--font-height ()
  "Calculate the actual char height of the mode-line."
  (+ (frame-char-height) 1))
(advice-add #'doom-modeline--font-height :override #'my-doom-modeline--font-height)

(use-package all-the-icons
  :ensure t
  :config
  (setq inhibit-compacting-font-caches t))

(provide 'init-doom-modeline)
;;; init-doom-modeline.el ends here
