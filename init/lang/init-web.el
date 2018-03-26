;;; init-web --- web
;;; Commentary:
;;; Code:

;; list packages for web development
(defvar web-packages
  '(
    web-mode
    emmet-mode
    rainbow-mode
    )
  )

(my-install-packages web-packages)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gtpl\\'" . web-mode));; golang

(add-hook 'web-mode-hook 'my-web-mode-hook)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'web-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(dolist (hook '(web-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'rainbow-mode))

;; Hooks for web mode
(defun my-web-mode-hook()
  "Hooks for web mode."
  (setq web-mode-markup-indent-offset 2);; HTML offset indentation
  (setq web-mode-css-indent-offset 2);; CSS offset indentation
  (setq web-mode-code-indent-offset 2);; Script offset indentation (for JavaScript, Java, PHP, etc.)
  (setq web-mode-style-padding 2);; Left padding for <style>
  (setq web-mode-script-padding 2);; Left padding for <script>
  (setq web-mode-block-padding 0);; Left padding for multi-line blocks

  ;; Comments
  ;;You can choose to comment with server comment instead of client (HTML/CSS/Js) comment with
  (setq web-mode-comment-style 2)

  ;; Syntax Highlighting
  ;;Change face color
  (set-face-attribute 'web-mode-folded-face nil :foreground "Pink3")

  ;; CSS colorization
  (setq web-mode-enable-css-colorization t)
  ;;Block face: can be used to set blocks background and default foreground (see web-mode-block-face)
  (setq web-mode-enable-block-face t)
  ;;Part face: can be used to set parts background and default foreground (see web-mode-script-face and web-mode-style-face which inheritate from web-mode-part-face)
  (setq web-mode-enable-part-face t)

  ;; Comment keywords (see web-mode-comment-keyword-face)
  (setq web-mode-enable-comment-keywords t)

  ;; Heredoc (cf. PHP strings) fontification (when the identifier is <<<EOTHTML or <<<EOTJAVASCRIPT)
  (setq web-mode-enable-heredoc-fontification t)

  ;; Current element / column highlight
  ;; Highlight current HTML element (see web-mode-current-element-highlight-face)
  (setq web-mode-enable-current-element-highlight t)
  ;; You can also highlight the current column with
  (setq web-mode-enable-current-column-highlight t)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

(provide 'init-web)
;;; init-web.el ends here
