;;; init-helm.el --- helm
;;; Commentary:
;;; Code:

(when (maybe-require-package 'helm)
  (add-hook 'after-init-hook (lambda()(require 'helm-config)(helm-mode 1)))
  (with-eval-after-load 'helm
    (setq
     helm-M-x-fuzzy-match t ;; optional fuzzy matching for helm-M-x
     helm-buffers-fuzzy-matching t;; enable fuzzy matching
	 helm-recentf-fuzzy-match t)
    
    ;; helm-M-x provides key bindings. Use TAB show build-in documentation of command in another buffer
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action

    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x c l") 'helm-locate)
    
    ;; with helm-man-woman(C-x c m) you can quickly jump to any man.
    ;; enable man page at point,add the following code:
    (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
    )
  )

(provide 'init-helm)
;;; init-helm.el ends here
