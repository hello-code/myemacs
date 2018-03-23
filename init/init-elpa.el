;;; init-elpa --- emacs pacakge
;;; Commentary:
;;; Code:

;;(require 'package)

;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))

(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ("org"   . "http://elpa.emacs-china.org/org/")))


(setq package-enable-at-startup nil)
(package-initialize)

(defun my-install-packages (packages)
  "Install PACKAGES."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (pkg packages)
    (unless (package-installed-p pkg)
      (package-install pkg))
    ))

(provide 'init-elpa)
;;; init-elpa.el ends here
