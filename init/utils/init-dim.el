;;; init-dim.el --- change the names of major and minor modes
;;; Commentary:
;;; https://github.com/alezost/dim.el
;;; Code:

(maybe-require-package 'dim)

;; dim
;; Shorter modeline
(with-eval-after-load 'projectile
  (setq-default
   projectile-mode-line
   '(:eval
     (if (file-remote-p default-directory)
         " Proj"
       (format " Proj[%s]" (projectile-project-name))))))

(dim-major-names
 '((emacs-lisp-mode    "EL")
   (js2-mode           "JS2")
   ))

(dim-minor-names
 '((visual-line-mode   " ↩")
   (auto-fill-function " ↵")
   (eldoc-mode         ""      eldoc)
   (company-mode       " CMP"  company)
   (undo-tree-mode     " Undo" undo-tree)
   (whitespace-mode    ""      whitespace)
   ))


;;;================================================
;;; delight
;;; https://www.emacswiki.org/emacs/DelightedModes
;;;================================================
;; (maybe-require-package 'delight)
;; (require 'delight)

;; (delight 'abbrev-mode " Abv" "abbrev")

;; (delight '((abbrev-mode " Abv" "abbrev")
;;            (smart-tab-mode " \\t" "smart-tab")
;;            (eldoc-mode nil "eldoc")
;;            (rainbow-mode)
;;            (undo-tree-mode "Undo" "undo-tree")
;;            (company-mode "CMP" "company")
;;            (overwrite-mode " Ov" t)
;;            (emacs-lisp-mode "Elisp2" :major)))


;;;==================================================
;;; cyphejor & diminish
;;; https://github.com/mrkkrp/cyphejor
;;; https://github.com/emacsmirror/diminish
;;;==================================================
;; (maybe-require-package 'cyphejor)
;; (maybe-require-package 'diminish)

;; ;; major mode
;; (require 'cyphejor)
;; (setq
;;  cyphejor-rules
;;  '(:upcase
;;    ("bookmark"    "→")
;;    ("buffer"      "β")
;;    ("diff"        "Δ")
;;    ("dired"       "δ")
;;    ("emacs"       "ε")
;;    ("inferior"    "i" :prefix)
;;    ("interaction" "i" :prefix)
;;    ("interactive" "i" :prefix)
;;    ("lisp"        "λ" :postfix)
;;    ("menu"        "▤" :postfix)
;;    ("mode"        "")
;;    ("package"     "↓")
;;    ("python"      "π")
;;    ("shell"       "sh" :postfix)
;;    ("text"        "ξ")
;;    ("wdired"      "↯δ")))

;; (cyphejor-mode 1)

;; ;; minor mode
;; (require 'diminish)
;; (eval-after-load "company" '(diminish 'company-mode))

(provide 'init-dim)
;;; init-dim.el ends here
