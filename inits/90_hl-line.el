;;;; Highlight current line
;; ir-black の region 選択の時の色に合わせた．
;; "M-x customize-face RET region" により確認出来た
(global-hl-line-mode t)
;; ハイライトなし下線のみ
(custom-set-faces
 '(hl-line ((t (:underline t :background nil)))))

;(custom-set-faces '(hl-line ((t (:underline t)))))
;; (defface hl-line '((t (:background "gray20"))
;;                    (:underline nil)))

;; ハイライトのみ下線なし．色はこれかな．でも見づらい時があるので
;(custom-set-faces
; '(hl-line ((t (:underline nil :background "DarkSlateGray")))))

;; 重い時に
;; (defun global-hl-line-timer-function ()
;;   (global-hl-line-unhighlight-all)
;;   (let ((global-hl-line-mode t))
;;     (global-hl-line-highlight)))
;; (setq global-hl-line-timer
;;       (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))

; ダメかぁ
;(defface my-hl-line-face
;  '((t (:underline t))
;    (t (:background nil))))
;(setq hl-line-face my-hl-line-face)
;(global-hl-line-mode t)

;; トグル関数．1行がとっても長い時なんかは OFF にしたくなるので
;; global-hl-line-mode の値は OFF の時 "nil", ON の時 "t" となってるみたい？なので...
;; Scheme 的に考えると，global-hl-line-mode の値は関数閉包？となるような気がするんだけどね．defun であって define じゃないところが関係するの？
(defun toggle-hl-line ()
  (interactive)                         ; M-x で呼び出せる
  (if global-hl-line-mode
      (global-hl-line-mode 0)           ; OFF
    (global-hl-line-mode t)             ; ON
    ))
