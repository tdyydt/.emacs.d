;; 日本語 & 文字コード (p.85)
;; 無くてもいけるものもあるが一応
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
;; 自動認識の際の優先順位
(set-coding-system-priority 'utf-8)

;; emacs でファイル作成する時のデフォルト文字コード
;; "with-signature" = BOM付 (ファイル先頭につける文字コードを表すモノ)
(set-default 'buffer-file-coding-system 'utf-8-unix)

;; この設定方法は obsolete = 廃れた．非推奨
; (setq default-buffer-file-coding-system 'utf-8-unix)
