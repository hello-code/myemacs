;;; init-elpa --- emacs pacakge
;;; Commentary:
;;; Code:

(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; (add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))

;; (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;                          ("melpa" . "http://elpa.emacs-china.org/melpa/")
;;                          ("org"   . "http://elpa.emacs-china.org/org/")))

;;; ===============================
;;; Tsinghua
;;; ===============================
;; (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;                          ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))



;; (defun my-install-packages (packages)
;;   "Install PACKAGES."
;;   (unless package-archive-contents
;;     (package-refresh-contents))
;;   (dolist (pkg packages)
;;     (unless (package-installed-p pkg)
;;       (package-install pkg))
;;     ))

;;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))

(defun my-install-packages (packages)
  "Install PACKAGES."
  (dolist (pkg packages)
    (unless (package-installed-p pkg)
      (maybe-require-package pkg))
    ))

;;; Fire up package.el
;(setq package-enable-at-startup nil)
;(package-initialize)

(provide 'init-elpa)
;;; init-elpa.el ends here
