;; font
;; Mac
;; いったん unicode 全体を japanese-font にした後に ascii だけ上書き

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Japanese font

;; (mapcar (lambda (charset)
;;           (set-fontset-font
;;            nil
;;            charset
;;            (font-spec :family (choose-japanese-font 0)
;;                       :size 12)))
;;         '(japanese-jisx0208
;;           #x309A        ; 半濁点 ゚
;;           #x3099        ; 濁点 ゙
;;           ))

(defun choose-japanese-font (v)
    (cond ((= v 0) "Hiragino Kaku Gothic ProN") ; 角ゴ
          ((= v 1) "Hiragino Maru Gothic ProN") ; 丸ゴ
          ((= v 2) "Hiragino Mincho ProN")      ; 明朝
          ((= v 3) "Hiragino Sans")             ; 詳細不明
          ))
(set-fontset-font
 nil
 'unicode
 (font-spec :family (choose-japanese-font 0)
                      :size 12))

;; 明朝は△。角ゴがデフォルト
;; 丸ゴもほとんど同じだが、よく見ると丸い。
;; Sans は角ゴに近い？
;; via: http://d.hatena.ne.jp/tomoya/20100828/1282948135

;; TODO:
;; set-fontset-font と set-face-attribute の違い？
;; via: http://lioon.net/emacs-change-font-size-quickly

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ascii font
;; Overwrite the above font for ascii chars

;; (2). Menlo
;; デフォルト (l が△)
;; (1). Monaco
;; mac-patch のときのデフォルト
;; 大きめ
;; (0). Inconsolata
;; フリーだが要インストール
;; Consolas に似せているらしい。
;; 数字が△．l が良い

;; Monaco 11pt, Inconsolata 14pt
;; がほぼ同じ大きさ
;; Menlo 12pt も同じくらい

(defun choose-ascii-font (v)
  (cond ((= v 0) '("Inconsolata" . 14)) ; preferred!!
        ((= v 1) '("Monaco" . 11))
        ((= v 2) '("Menlo" . 12))       ; default
        ))
(let ((chosen-font (choose-ascii-font 0)))
  (set-fontset-font
   nil
   'ascii
   (font-spec :family (car chosen-font)
              :size (cdr chosen-font))))
