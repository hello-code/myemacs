;;; init-doom-modeline.el --- mode line
;;; Commentary:
;;; https://seagle0128.github.io/doom-modeline/
;;; https://github.com/seagle0128/doom-modeline
;;; Code:

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init)
  :init
  (setq doom-modeline-height 20)
  (setq doom-modeline-bar-width 3)
  ;; Don’t compact font caches during GC.
  (setq inhibit-compacting-font-caches t)
  :config
  (set-face-attribute 'doom-modeline-bar nil :background "#4b82f0")
  ;; ;;; segments
  ;; ;; evil-state
  ;; (doom-modeline-def-segment evil-state
  ;;   "The current evil state.  Requires `evil-mode' to be enabled."
  ;;   (when (bound-and-true-p evil-local-mode)
  ;;     (s-trim-right (evil-state-property evil-state :tag t))))
  ;; (setq evil-normal-state-tag   (propertize "[N]" 'face '((:background "green" :foreground "black")))
  ;;       evil-emacs-state-tag    (propertize "[E]" 'face '((:background "orange" :foreground "black")))
  ;;       evil-insert-state-tag   (propertize "[I]" 'face '((:background "red") :foreground "white"))
  ;;       evil-motion-state-tag   (propertize "[M]" 'face '((:background "blue") :foreground "white"))
  ;;       evil-visual-state-tag   (propertize "[V]" 'face '((:background "grey80" :foreground "black")))
  ;;       evil-operator-state-tag (propertize "[O]" 'face '((:background "purple"))))

  ;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)
  ;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)
  
  ;; pomodoro segment
  (defun my-eval-string (string)
    "Evaluate elisp code stored in a string."
    (eval (car (read-from-string string))))

  (doom-modeline-def-segment pomodoro
                             "pomodoro segment"
                             (my-eval-string "pomodoro-mode-line-string"))
  
  (doom-modeline-def-modeline 'main
                              '(bar workspace-number window-number evil-state matches " " buffer-info buffer-position  " " selection-info)
                              '(pomodoro buffer-encoding major-mode process vcs  checker " "))

  ;; ;; Mode lines
  ;; (doom-modeline-def-modeline 'main
  ;;   '(bar workspace-number window-number evil-state matches " " buffer-info buffer-position  " " selection-info)
  ;;   '(global buffer-encoding major-mode process vcs flycheck))

  ;; (doom-modeline-def-modeline 'special
  ;;   '(window-number bar evil-state matches " " buffer-info-simple buffer-position " " selection-info)
  ;;   '(buffer-encoding major-mode flycheck global))

  ;; (custom-set-faces
  ;;  '(mode-line
  ;;    ((t (:background "#1c1f26" :foreground "#ffffff" :box (:line-width 1 :color "#4b82f0")))))
  ;;  '(mode-line-inactive
  ;;    ((t ( :foreground "gray80" :background "gray40" :box '(:line-width 1 :color "gray20" :style nil)))))
  ;;  )

  (custom-set-faces
   '(mode-line((t (:box(:line-width 1 :color "#4b82f0")))))
   '(mode-line-inactive((t (:box(:line-width 1 :color "gray" :style nil)))))
   )
  )

(use-package all-the-icons
  :ensure t
  :defer t
  :after neotree
  :config
  (setq inhibit-compacting-font-caches t))

(provide 'init-doom-modeline)
;;; init-doom-modeline.el ends here
