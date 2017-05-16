;; encoding
;; language environments

;; 日本語 & 文字コード (p.85)
;; 無くてもいけるものもあるが一応

;; Japanese にすると例えば tutorial (f1 t) が日本語になって
;; 嫌だ。
;; (set-language-environment "Japanese")
(set-language-environment "English")

;; たぶん English にすると ascii がデフォルトになるので、
;; ここで明示的に utf-8 に変更する必要がある。

(prefer-coding-system 'utf-8)
;; 自動認識の際の優先順位
(set-coding-system-priority 'utf-8)

;; emacs でファイル作成する時のデフォルト文字コード
;; "with-signature" = BOM付 (ファイル先頭につける文字コードを表すモノ)
(set-default 'buffer-file-coding-system 'utf-8-unix)

;; この設定方法は obsolete = 廃れた．非推奨
; (setq default-buffer-file-coding-system 'utf-8-unix)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; charanters
;; TODO: move to another file
;; utility, char, ...

;; 濁点半濁点分離問題の解消
;; ucs-normalize-NFC-region 関数が使える
;; REF: http://tech.3rd-p-zombie.net/entry/20120805/1344169124
(require 'ucs-normalize)

;; TODO:
;; 似た名前の normalize 関数が二つあってどちらかわからなくなるので
;; alias を。
