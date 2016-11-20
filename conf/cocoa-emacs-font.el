;; font
;; Mac

;; COMMENT: [May 23, 2016]
;; かなり状況が改善した。
;; set-fontset-font で、日本語フォントのサイズと、
;; ascii フォントのサイズを別々に設定している。
;; 行儀が良いのかはわからないけれど、これが一番良い！

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; japanese font

;; 明朝は少し違う。角ゴがデフォルトと思う。
;; 丸ゴもほとんど同じだが、良く見ると確かに丸い。
;; Sans は角ゴと変わらんというか、謎。
;; via: http://d.hatena.ne.jp/tomoya/20100828/1282948135

(defun choose-japanese-font (v)
    (cond ((= v 0) "Hiragino Kaku Gothic ProN") ; 角ゴ
          ((= v 1) "Hiragino Maru Gothic ProN") ; 丸ゴ
          ((= v 2) "Hiragino Mincho ProN")      ; 明朝
          ((= v 3) "Hiragino Sans")             ; 詳細不明
          ))
(mapcar (lambda (charset)
          (set-fontset-font
           nil
           charset
           (font-spec :family (choose-japanese-font 0)
                      :size 12)))
        '(japanese-jisx0208
          #x309A        ; 半濁点 ゚
          #x3099        ; 濁点 ゙
          ;;
          ;; 'unicode
          ;; にして ascii も含めて設定してから、下で ascii だけ上書きする
          ;; という考え方もあり得る。
          ))

;; TODO: [May 23, 2016]
;; set-fontset-font というのと、set-face-attribute
;; というのがあって、この違いが謎。set-fontset-font だけでも行けそうで、
;; こちらのほうが直感的に分かりやすいので、こうする。
;; いつか
;; REF: http://lioon.net/emacs-change-font-size-quickly

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ascii font

;; (2). Menlo
;; デフォルト
;; 結構慣れてきている感じがある。
;; l の感じが多分好きじゃない。
;; (1). Monaco
;; mac-patch のときのデフォルト
;; カワイイ系で、割とデカい。
;; iTerm 等で使用中。Emacs で使うには少し煩いのかもしれない
;; (0). Inconsolata
;; 人気のフリーフォント
;; Consolas に似せているとか。数字の感じがちょっと違和感？
;; l の感じは好き！

;; [May 25, 2016] Monaco も少し使ってみるかあ。Inconsolata やっぱり
;; 数字だけフォントを変えるという荒業もあろうが、1 と l の区別が曖昧に
;; なったりしかねない。

;; フォントを変えやすく [May 23, 2016]
;; サイズは割と相対的なもののようなので、ちょうど良いサイズとの
;; コンスセルを作っておく。

;; 実験の結果、
;; Monaco 11pt, Inconsolata 14pt
;; がほぼ同じ大きさ！
;; Menlo 12pt とは少しずれるが、これくらいがちょうど！

(defun choose-ascii-font (v)
  (cond ((= v 0) '("Inconsolata" . 14)) ; prefered!!
        ((= v 1) '("Monaco" . 11))
        ((= v 2) '("Menlo" . 12))       ; default
        ))
(let ((chosen-font (choose-ascii-font 0)))
  (set-fontset-font
   nil
   'ascii
   (font-spec :family (car chosen-font)
              :size (cdr chosen-font))))
