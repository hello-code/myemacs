;;; init-web --- web
;;; Commentary:
;;; Code:

(use-package web-mode
  :defer t
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode));; golang
  :config
  (setq web-mode-markup-indent-offset 4);; HTML offset indentation
  (setq web-mode-css-indent-offset 4);; CSS offset indentation
  (setq web-mode-code-indent-offset 4);; Script offset indentation (for JavaScript, Java, PHP, etc.)
  (setq web-mode-style-padding 4);; Left padding for <style>
  (setq web-mode-script-padding 4);; Left padding for <script>
  (setq web-mode-block-padding 0);; Left padding for multi-line blocks

  ;; Comments
  ;;You can choose to comment with server comment instead of client (HTML/CSS/Js) comment with
  (setq web-mode-comment-style 2)

  ;; Syntax Highlighting
  ;;Change face color
  ;;(set-face-attribute 'web-mode-folded-face nil :foreground "Pink3")

  ;; CSS colorization
  ;; css use color name (red,yellow...) not working. rainbow-mode can work in html-mode.
  ;; (setq web-mode-enable-css-colorization t)
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

(use-package emmet-mode
  :ensure t
  :diminish (emmet-mode . "E")
  :after(web-mode)
  :init
  (setq emmet-indentation 4)
  (setq emmet-move-cursor-between-quotes t)
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode))

(use-package web-beautify
  :ensure t
  :bind (:map web-mode-map
              ("C-c b" . web-beautify-html)
              :map js2-mode-map
              ("C-c b" . web-beautify-js)))

(provide 'init-web)
;;; init-web.el ends here
