;;; init-spaceline.el --- spaceline
;;; Commentary:
;;; https://github.com/TheBB/spaceline
;;; Code:

(defvar modeline-package
  '(spaceline
    all-the-icons
    spaceline-all-the-icons
    ))

(require 'package)
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package modeline-package)
  (unless (package-installed-p package)
    (package-install package)))

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq powerline-text-scale-factor 1.0) ;; mode line font size

;;; faces
;; Active faces
;;   spaceline-highlight-face ;; The face that changes the highlighted part
;;   powerline-active1  ;; The face used for the second segment
;;   powerline active2  ;; The face used for the third segment
;;   mode-line  ;; The face used for the middle part of the mode line

;;   ;; Inactive faces
;;   powerline-inactive-1
;;   powerline-inactive-2
;;   mode-line-inactive

(custom-set-faces
 '(powerline-active2 ((t (:background "dim gray" :foreground "#ffffff"))))
 ;;'(spaceline-highlight-face(( t (:background "blue")))) ;; default color is orange
 '(mode-line ((t (:box (:line-width 1 :color "#4B82F0")))))
 '(mode-line-inactive ((t (:box (:line-width 1 :color "#A1B57C")))))
 )

(require 'spaceline-all-the-icons)
(spaceline-all-the-icons-theme)
(spaceline-all-the-icons--setup-neotree) ;; Enable Neotree mode line
;; (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
;; (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git

;; (spaceline-toggle-all-the-icons-buffer-position-on)
;; (spaceline-toggle-all-the-icons-git-status-on)
;; ;; (setq spaceline--info-nodes t)
;; (setq spaceline-all-the-icons-hide-long-buffer-path t)

;; (spaceline-toggle-all-the-icons-minor-modes)
;; (setq spaceline-all-the-icons-minor-modes-p t)

(defvar spaceline-all-the-icons-icon-set-window-numbering)
(setq spaceline-all-the-icons-icon-set-window-numbering 'square )
;;(spaceline-toggle-all-the-icons-minor-modes-on)

;; https://github.com/domtronn/all-the-icons.el/issues/28
;;(setq inhibit-compacting-font-caches t)

(provide 'init-spaceline)
;;; init-spaceline.el ends here
