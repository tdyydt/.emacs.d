;; Search and Replace

;; migemo:

;; 日本語文字をローマ字で検索できるようにする。
;; cmigemo コマンド (install by brew) を用いる。
;; cmigemo をインストールしていない時は通常の検索を使う
;; via: http://qiita.com/catatsuy/items/c5fa34ead92d496b8a51
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
;; visual-regexp
;; 正規表現を使いやすくする

;; URLs
;; http://rubikitch.com/2015/04/20/visual-regexp-steroids/
;; https://github.com/benma/visual-regexp.el

;; vr/replace (一括変換)
;; vr/query-replace (対話)
;; 'C-c a' でマッチした部分をハイライト

;; keybind
;; (when (require 'visual-regexp nil t)
;;   ;(global-set-key (kbd "M-%") 'query-replace)
;;   (global-set-key (kbd "C-M-%") 'vr/query-replace))

(when (require 'visual-regexp-steroids nil t)
  ;; python の正規表現を使う (default)
  (setq vr/engine 'python)
  ;; 普段の正規表現 isearch にも
  ;; steroid を使う
  (global-set-key (kbd "C-M-r") 'vr/isearch-backward)
  (global-set-key (kbd "C-M-s") 'vr/isearch-forward)
  )
