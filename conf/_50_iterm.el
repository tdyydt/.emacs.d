;; Emacs から iTerm にコマンドを送る
;; REF: http://blog.shibayu36.org/entry/2014/02/10/174424

;; => 動かない

(defun execute-on-iterm (command)
  (interactive "MCommand: ")
  (do-applescript
   (format "tell application \"iTerm\"
              activate
              tell current session of current terminal
                write text \"%s\"
              end tell
            end tell"
           command)))

(defun cd-on-iterm ()
  (interactive)
  (execute-on-iterm (format "cd %s" default-directory)))
