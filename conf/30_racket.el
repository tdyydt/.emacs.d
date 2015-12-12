;; racket config

;; racket install log:
;; % brew install racket
;; raco = package management tool for Racket
;; 始めから入っているわけでは無いようなので導入
;; % raco pkg install parser-tools

;; 6.5 を導入して 6.3 は消したところ、パッケージの再導入が必要になった
;; インストール過程を見ていると 6.3 という文字がちらほら
;; 大人しく 6.3 使っておけばよかったような

;; to load racket file:
;; > (enter! "parser.rkt")

;; まえに導入していた Racket-mode は削除した。4/11

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Geiser
;; Geiser is an Emacs environment to hack and have fun in Scheme.
(setq geiser-racket-binary "racket")
(setq geiser-active-implementations '(racket))
;(setq geiser-repl-read-only-prompt-p nil)

;; autodoc mode が煩いから、止める
(setq geiser-mode-autodoc-p nil)

;; geiser-racket-init-file
;; に設定されている文字列ファイルが、racket 起動時に実行される
;; 初期値のままだが明示的に書いておく
(setq geiser-racket-init-file "~/.racket-geiser")
