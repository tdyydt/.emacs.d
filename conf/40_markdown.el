;; markdown mode

(setq markdown-indent-on-enter nil)

;; markdown-open via MacDown.app
;; (setq markdown-open-command "open -a MacDown")
;; open だけで行ける
;; (MacDown が関連付けられていれば)
(setq markdown-open-command "open")

;; あまり融通が効かないので、使えない
;; advice とか
;;(setq markdown-command-needs-filename nil)
;;(setq markdown-command

;; pandoc README.md -o README.html && open README.html
