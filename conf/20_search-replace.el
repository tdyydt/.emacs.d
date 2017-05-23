;; Search and Replace

;; migemo:
(el-get-bundle migemo)
;; 日本語文字をローマ字で検索できるようにする。
;; cmigemo コマンド (install by brew) を用いる。
;; cmigemo がインストールして居ない時は通常の検索を使えるように
;; 参考 http://qiita.com/catatsuy/items/c5fa34ead92d496b8a51
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  ;; migemo コマンドの場所、辞書データの場所を設定しないといけない
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-regex-dictionary nil)
  ;; default では OFF にしておいて, 'M-m' で切り替えるようにする
  (setq migemo-isearch-enable-p nil)
  (load-library "migemo")
  (migemo-init))

;; 'M-m' (migemo-isearch-toggle-migemo)
;; で migemo を使うかどうか toggle 出来る。

;; migemo は正規表現なのが少し使いづらい

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; improve replacement by regular expressions

;; URLs
;; http://rubikitch.com/2015/04/20/visual-regexp-steroids/
;; https://github.com/benma/visual-regexp.el
(el-get-bundle visual-regexp)
(el-get-bundle visual-regexp-steroids)

;; vr/replace (一括変換)
;; vr/query-replace (対話？)
;; などの 'vr/' という関数がそれ
;; 'C-c a' でマッチした部分をハイライト。とても便利。

;; by default:
;; M-% (query-replace)
;; C-M-% (query-replace-regexp; 正規表現版)
;; => 使いにくいので
;; M-% (vr 版の正規表現置換)
(when (require 'visual-regexp nil t)
  ;(global-set-key (kbd "M-%") 'query-replace)
  (global-set-key (kbd "C-M-%") 'vr/query-replace))

(when (require 'visual-regexp-steroids nil t)
  ;; python の正規表現を使う (default)
  (setq vr/engine 'python)
  ;; 普段の正規表現 isearch にも
  ;; steroid を使う
  (global-set-key (kbd "C-M-r") 'vr/isearch-backward)
  (global-set-key (kbd "C-M-s") 'vr/isearch-forward)
  )

;; 何度も繰り返し行うときは関数にして、登録してからやるといい
;; TODO: vr/query-replace が case-insensitive になってる？？
;; => isearch-toggle-case-fold が関係ありそう
;; Type \\[isearch-toggle-case-fold] to toggle search case-sensitivity.
