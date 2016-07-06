;; Company-mode
;; http://company-mode.github.io
;; https://www.emacswiki.org/emacs/CompanyMode
;; (add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybind
;; M-x company-complete で補完
;; M-Tab で company 補完 (これは、company active map だと変だ。)
;; C-M-i とかも普通らしい (M-i は <tab> なので、C-<tab> ということかな)
(define-key global-map (kbd "M-<tab>") 'company-complete)

;; Ref; http://qiita.com/sune2/items/b73037f9e85962f5afb7
;(define-key company-active-map (kbd "M-<tab>") 'company-complete)
;; 矢印キーで候補選択肢ない。
(define-key company-active-map (kbd "<up>") nil)
(define-key company-active-map (kbd "<down>") nil)
;; C-h はヘルプには使わない。
(define-key company-active-map (kbd "C-h") nil)

;; 補完を完了する
;; (kbd "<return>"), [return] を試したが、
;; (kbd "RET") = 
;; が正解らしい
(define-key company-active-map (kbd "RET") nil)
;; RET で決定されるとウザいから、tab に変える。
;; こちらは (kbd "<tab>") のほうが正解のようです
(define-key company-active-map (kbd "<tab>") 'company-complete-selection)
;(define-key company-active-map (kbd "TAB") 'company-complete-selection)

;; TODO: うまく効いていない
;; RET で補完完了してしまう


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; M-n / M-p で選択
;; 一番下から下に行くと上に行く
(setq company-selection-wrap-around t)

;; 自動で補完
;; nil を設定すると、自動では保管しない。
;; デフォルトは '.5' (0.5)
;(setq company-idle-delay 1)
(setq company-idle-delay nil)
;(setq company-minimum-prefix-length 2) ; デフォルトは4

;; TODO: 日本語は補完対象外にする。
;; AC はやり方がネットにあったが、company のほうは如何せん、日本語ユーザが少ないのでね

;; TODO: AC みたいに、major mode ごとに、単語を記憶
;; 他の major mode で出て来てるワードから補完

;; Tips:
;; M-x describe-key-briefly (F1 c)
;; とすると、矢印キーの名前とか分かる。
