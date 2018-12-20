;; font for Ubuntu
;; font size configured for 4K display

;; For all characters:
(set-fontset-font
 nil
 'unicode
 (font-spec :family "TakaoPGothic"
            :size 20))


;; Overwrite above for ASCII chars:
;; Ubuntu Mono
(set-fontset-font
 nil
 'ascii
 (font-spec :family "Ubuntu Mono"
            :size 22))
