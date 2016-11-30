;; Company-mode
;; http://company-mode.github.io
;; https://www.emacswiki.org/emacs/CompanyMode
;; (add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)

;; 自動で補完しない
(setq company-idle-delay nil)

;; 一番下から下に行くと上に行く
(setq company-selection-wrap-around t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybind
;; M-x company-complete で補完
;; M-Tab で company 補完 (これは、company active map だと変だ。)
;; C-M-i とかも普通らしい (M-i は <tab> なので、C-<tab> ということかな)
(define-key global-map (kbd "M-<tab>") 'company-complete)

;; replace dabbrev with company-dabbrev
;; This completes words in the buffers.
(define-key global-map (kbd "M-/") 'company-dabbrev)
;; case sensitive
;; デフォルトでは勝手に lowercase に直して補完しやがる。
;; via: http://tam5917.hatenablog.com/entry/2016/04/25/204532
(setq company-dabbrev-downcase nil)

;; 他の関数もある？
;; company-complete-common-or-cycle
;; company-indent-or-complete-common

;; via: http://qiita.com/sune2/items/b73037f9e85962f5afb7
;; (define-key company-active-map (kbd "M-<tab>") 'company-complete)
;; 矢印キーで候補選択しない。
(define-key company-active-map (kbd "<up>") nil)
(define-key company-active-map (kbd "<down>") nil)
;; C-h はヘルプには使わない。
(define-key company-active-map (kbd "C-h") nil)

;; 補完を完了する
;; RET ではなくて TAB に変える。
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
;; RET を無効に
(define-key company-active-map (kbd "RET") nil)
(define-key company-active-map (kbd "<return>") nil)

;; TODO: うまく効いていない
;; RET で補完完了してしまう

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Issues:

;; TODO: 日本語は補完対象外にする。
;; AC はやり方がネットにあったが、company のほうは如何せん、日本語ユーザが少ないのでね
;; => 数字を対象外という話がある
;; via: http://emacs.stackexchange.com/questions/9835/how-can-i-prevent-company-mode-completing-numbers

;; TODO: AC みたいに、major mode ごとに、単語を記憶
;; 他の major mode で出て来てるワードから補完

;; company-files によるファイル名の補完
;; via: http://emacs.stackexchange.com/questions/3654/filename-completion-using-company-mode

;; company
;; complete words in buffers
;; That is company-dabbrev, named after the dabbrev command bound to M-/.
;; via: http://emacs.stackexchange.com/questions/15179/company-backend-for-words-inside-the-buffer
;; company-dabbrev というのを使えばよかったのか。

;; company-dabbrev-code というのは何だ？？
;; コメントは無視するとか、そういうことか？

;; dabbrev の結果を company-complete でも出したい。
;; それはここに書いて有りそう
;; via: http://emacs.stackexchange.com/questions/15246/how-add-company-dabbrev-to-the-company-completion-popup
;; ためになりそうなので、読みたい。
