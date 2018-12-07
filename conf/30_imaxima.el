;; imaxima
;; via: https://sites.google.com/site/imaximaimath/download-and-install/easy-install-on-mac-os-x

;; maxima はパスが通っているので、設定しない
;; imaxima 用の elisp を path に追加
(add-to-list 'load-path
             (car (file-expand-wildcards "/usr/local/Cellar/maxima/*/share/maxima/*/emacs")))

(autoload 'imaxima "imaxima" "Maxima frontend" t)
;(autoload 'imath "imath" "Interactive Math mode" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)


;; output の
;; TeX 形式のサイズ指定。
;; small, normalsize, large
;; Large, LARGE, huge, Huge
(setq imaxima-fnt-size "Large")

;; 画像の拡大率で指定することも可能 (使わない)
;; (setq imaxima-scale-factor 1.0)

;; preamble を設定できる
;; 数式フォントの変更
;; concrete にすると、一回目が少し遅いか？
(setq imaxima-latex-preamble "\\usepackage{concrete}\n")
