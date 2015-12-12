;; graphviz dot mode
;; dot ファイルを書くための major mode

;; インデント幅が 8 で大きく感じた。
;; が、これは emacs で定義されている
;; default-tab-width を見て決めたものらしい。
;; (setq default-tab-width 4)
;; という方法もあり得るが、
;; 他に影響があるといけないので、後で考える。

;; ひとまず graphviz だけの設定
(setq graphviz-dot-indent-width 2)

;; お節介をやめる
(setq graphviz-dot-auto-indent-on-newline nil)
(setq graphviz-dot-auto-indent-on-semi nil)

;; graphviz
;; REF: http://qiita.com/rubytomato@github/items/51779135bc4b77c8c20d
