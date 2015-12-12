;; Scroll
;; スクロールのチューニング

;; スクロールを2行ずつに
;; 矢印キーなどによるスクロールが対象，マウススクロールは別
(setq scroll-conservatively 2)

;; マウススクロール 加速を無効に
(setq mouse-wheel-progressive-speed nil)

;; マウススクロールを上下それぞれ2行ずつに
;; デフォルトでは，この値が5行くらい
(defun scroll-down-with-lines ()
  (interactive)
  (scroll-down 2))
(defun scroll-up-with-lines ()
   (interactive)
   (scroll-up 2))

(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
;; (global-set-key [double-wheel-up] 'scroll-down-with-lines)
;; (global-set-key [double-wheel-down] 'scroll-up-with-lines)
;; (global-set-key [triple-wheel-up] 'scroll-down-with-lines)
;; (global-set-key [triple-wheel-down] 'scroll-up-with-lines)
