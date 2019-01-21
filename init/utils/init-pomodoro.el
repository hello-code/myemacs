;;; init-pomodoro.el --- pomodoro
;;; https://github.com/baudtack/pomodoro.el
;;; Commentary:
;;; Code:

(use-package pomodoro
  :ensure t
  :config
;;  (global-set-key "\M-p" 'pomodoro-start)
  ;;(pomodoro-add-to-mode-line)
  (setq pomodoro-work-cycle "[W]") ;; 在状态栏显示的字符
  (setq pomodoro-work-break "[B]")
  ;;  设置一个番茄时间的长度(默认25分钟)
  ;;(setq pomodoro-work-time 45)
  ;; 开始工作的音乐
  (setq pomodoro-work-start-sound "~/myemacs/resource/work.wav")
  (setq pomodoro-work-start-message "It's time to working!\n")
  ;; 设置间隔休息时间(默认5分钟)
  ;;(setq pomodoro-break-time 10)
  ;; 开始休息的音乐
  (setq pomodoro-break-start-sound "~/myemacs/resource/rest.wav")
  (setq pomodoro-break-start-message
        (concat "Have a rest - "
                (number-to-string pomodoro-break-time) "minutes.\n"))

  ;; Using 'play-sound-file' rather than 'call-process'.
  (if (eq system-type 'windows-nt)
      (defun play-pomodoro-sound (sound)
        "Overwrite function.Play SOUND file."
        (play-sound-file sound)))
  ;; In some reason will show --- Error running timer pomodoro-tick': (error "Unsupported WAV file format").
  ;; So use default player:mplayer.

  (setq-default mode-line-format
                (cons mode-line-format '(pomodoro-mode-line-string)))
  )
(provide 'init-pomodoro)
;;; init-pomodoro.el ends here
