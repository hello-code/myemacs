;;; init-avy.el --- Jump to things in Emacs tree-style
;;; Commentary:
;;; https://github.com/abo-abo/avy
;;; Code:
(maybe-require-package 'avy)

(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(setq avy-all-windows 'all-frames)

(provide 'init-avy)
;;; init-avy.el ends here
