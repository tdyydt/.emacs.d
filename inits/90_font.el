;;;;; Font
;; Windows
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil
                      :family "Consolas"
                      :height 98)
  (set-fontset-font
   nil
   'japanese-jisx0208
   (font-spec :family "メイリオ"))
  (setq face-font-rescale-alist
        '((".*Consolas.*" . 1.0)
          (".*メイリオ.*" . 0.95)
          ;; ("-cdac$" . 1.3)  ; what this means??
          )))
;; デフォルトで使ってみてはどうか？ 2015/11/02
;; Mac
;; (when (or (eq window-system 'ns)
;;           (eq window-system 'mac))
;;   (set-face-attribute 'default nil
;;                       :family "Menlo"
;;                       :height 120)
;;   (set-fontset-font
;;    nil
;;    'japanese-jisx0208
;;    (font-spec :family "ヒラギノ角ゴ Pro"))
;;   (setq face-font-rescale-alist
;;         '((".*Menlo.*" . 1.0)
;;           (".*ヒラギノ角ゴ Pro.*" . 1.2)
;;           ;(".*Hiragino_Mincho_Pro.*" . 1.2)
;;           ;(".*nfmotoyacedar-bold.*" . 1.2)
;;           ;(".*nfmotoyacedar-medium.*" . 1.2)
;;           ("-cdac$" . 1.3))))

;; 注意
;; ".*" というのは正規表現と思われる．
