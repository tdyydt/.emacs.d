;; font for Ubuntu

;; 日本語のサイズの調整が必要
;; TODO: サイズの調整

;; For all characters:
(set-fontset-font
 nil
 'unicode
 (font-spec :family "TakaoPGothic"
            :size 12))


;; Overwrite above for ASCII chars:
;; Ubuntu Mono
(set-fontset-font
 nil
 'ascii
 (font-spec :family "Ubuntu Mono"
            :size 12))
