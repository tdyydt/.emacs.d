;;;; Highlight current line
;; ir-black の region 選択の時の色に合わせた．
;; "M-x customize-face RET region" により確認出来た
(global-hl-line-mode t)

;; color 236 はあまり見えない。
;; gray20
;; REF: http://homepage1.nifty.com/blankspace/emacs/emacs_rgb.html
(let ((bg-color "gray-15"))
  (custom-set-faces
 ;'(hl-line ((t (:underline t :background nil))))
 ;'(hl-line ((t (:background "color-236"))))
   `(hl-line ((t (:background ,bg-color))))
   `(col-highlight ((t (:background ,bg-color))))
   ))

;(custom-set-faces '(hl-line ((t (:underline t)))))
;; (defface hl-line '((t (:background "gray20"))
;;                    (:underline nil)))

;; also, hilight cursor column
;; REF: https://www.emacswiki.org/emacs/HighlightCurrentColumn
(column-highlight-mode 0)
(col-highlight-set-interval 10)
;; TODO: マルチバイト文字があるとずれるので、無視できるようにしたい。
;; col-highlight-show-only が使える？
;; (setq col-highlight-show-only 'forward-paragraph)

;; トグル関数
;; (defun toggle-hl-line ()
;;   (interactive)                         ; M-x で呼び出せる
;;   (if global-hl-line-mode
;;       (global-hl-line-mode 0)           ; OFF
;;     (global-hl-line-mode t)             ; ON
;;     ))

;; crosshairs
;; REF: https://www.emacswiki.org/emacs/CrosshairHighlighting
;; col-highlight, hl-line 等を統一的に使う？
