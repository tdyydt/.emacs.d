;; spell check on emacs
;; install 'aspell' by brew (May 19, 2016)

;; REF: https://texwiki.texjp.org/?Aspell
;; OFFICIAL: https://www.gnu.org/software/emacs/manual/html_node/emacs/Spelling.html
;; REF: http://keisanbutsuriya.hateblo.jp/entry/2015/02/10/152543

;; ~/.aspell.conf に
;; lang en_US
;; と書いて日本語の辞書を探さないように


;; Use aspell (default: ispell)
(setq-default ispell-program-name "aspell")

;; 日本語混じりの文でも、日本語を無視して英文のみスペルチェックさせる。
(eval-after-load "ispell"
 '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))


;; 便利な機能:
;; M-x ispell
;; M-x flyspell-buffer
;; -> スペルミス部分を波下線ですべて表示
;; M-x flyspell-mode
;; -> リアルタイムでスペルチェックを行うモード

;; M-x ispell-complete-word
;; という補完機能もあるらしい。M-tab に割り当て？？

;; TODO: 固有名詞を辞書に追加
