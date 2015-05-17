;; imaxima
;; https://sites.google.com/site/imaximaimath/download-and-install/easy-install-on-mac-os-x
;(when (eq system-type 'windows-nt)
;  (load "c:/Program Files (x86)/Maxima-5.31.2/share/maxima/5.31.2/emacs/setup-imaxima-imath.el"))
;; (setq imaxima-scale-factor 1.2)
(setq imaxima-fnt-size "Large") ; 14.4pt (p.53)

;; .profile とかに追加してしまう手も --> exec-path はもうこうしよう！ターミナルのを使うということで、あのelispにお任せしよう。
;; for ghostscript
;(push "/usr/local/bin" exec-path) 不要！
;; for gnuplot
;(push "/Applications/Gnuplot.app/Contents/Resources/bin" exec-path)
;; for maxima
;;(push "/Applications/Maxima.app/Contents/Resources/" exec-path)
;;(setq imaxima-image-type 'png)
(setq imaxima-maxima-program "/Applications/Maxima.app/Contents/Resources/maxima.sh")

(push "/Applications/Maxima.app/Contents/Resources/maxima/share/maxima/5.36.1/emacs" load-path) ; elisp のパス
(autoload 'imaxima "imaxima" "Maxima frontend" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
