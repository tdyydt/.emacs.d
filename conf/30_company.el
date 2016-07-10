;; Company-mode
;; http://company-mode.github.io
;; https://www.emacswiki.org/emacs/CompanyMode
;; (add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)

;; 自動で補完
(setq company-idle-delay nil)

;; 一番下から下に行くと上に行く
(setq company-selection-wrap-around t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybind
;; M-x company-complete で補完
;; M-Tab で company 補完 (これは、company active map だと変だ。)
;; C-M-i とかも普通らしい (M-i は <tab> なので、C-<tab> ということかな)
(define-key global-map (kbd "M-<tab>") 'company-complete)

;; 他の関数もある？
;; company-complete-common-or-cycle
;; company-indent-or-complete-common

;; Ref; http://qiita.com/sune2/items/b73037f9e85962f5afb7
;(define-key company-active-map (kbd "M-<tab>") 'company-complete)
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

;; TODO: 日本語は補完対象外にする。
;; AC はやり方がネットにあったが、company のほうは如何せん、日本語ユーザが少ないのでね

;; TODO: AC みたいに、major mode ごとに、単語を記憶
;; 他の major mode で出て来てるワードから補完
