;; ott-mode
;; https://github.com/ott-lang/ott

(add-to-list 'load-path
             (expand-file-name "~/.opam/system/share/ott/emacs"))
;;(require 'ott-mode)

;; Ott v0.25 ではハイフン区切りになってないみたい？
;; 変更があったのかもしれん
(require 'ottmode)
