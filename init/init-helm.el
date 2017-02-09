;;; init-helm.el --- helm
;;; Commentary:
;;; Code:

;;http://tuhdo.github.io/helm-intro.html
;;https://github.com/gjstein/emacs.d/blob/master/config/init-20-nav-interface.el

;; shows the kill ring
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
;; enable fuzzy matching
(setq helm-buffers-fuzzy-matching t
	  helm-recentf-fuzzy-match t)

(require 'helm-config)
(helm-mode 1)

;; semantic
(semantic-mode 1)
(setq helm-semantic-fuzzy-match t
	  helm-imenu-fuzzy-match t)
(global-set-key (kbd "<f7>") 'helm-semantic-or-imenu)

;; helm-M-x provides key bindings. Use TAB show build-in documentation of command in another buffer
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action

;; with helm-man-woman(C-x c m) you can quickly jump to any man.
;; enable man page at point,add the following code:
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x c l") 'helm-locate)

(provide 'init-helm)
;;; init-helm.el ends here