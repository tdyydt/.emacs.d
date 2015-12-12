;; font
;; Windows (windows-nt)

;; 試す機会が無いが、大丈夫？？
;; [May 23, 2016]


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
        ))
