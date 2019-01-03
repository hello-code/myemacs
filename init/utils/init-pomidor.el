;;; init-pomidor.el --- pomidor
;;; https://github.com/TatriX/pomidor
;;; Commentary:
;;; Code:

(use-package pomidor
  :ensure t
  :config
  (global-set-key "\M-p" #'pomidor)

  (setq
   ;;pomidor-sound-tick nil ;; nil取消声音
   ;;pomidor-sound-tack nil ;; nil取消声音
   pomidor-sound-tick (expand-file-name (concat (getenv "HOME") "/myemacs/resource/tick.wav"))
   pomidor-sound-tack (expand-file-name (concat (getenv "HOME") "/myemacs/resource/tack.wav"))
   pomidor-sound-overwork (expand-file-name (concat (getenv "HOME") "/myemacs/resource/ring.wav"))
   pomidor-sound-break-over (expand-file-name (concat (getenv "HOME") "/myemacs/resource/rest.wav"))
   )  
  )
(provide 'init-pomidor)
;;; init-pomidor.el ends here
