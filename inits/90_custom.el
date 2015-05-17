;; 透過度
;; ("0"→もっとも透明)
;; Windows: alpha = 88
;; Mac: alpha = 75 ~ 80
;; alpha = 0.80
;; solarized (dark) だと 0.85 くらい

;; (let ((my-alpha 0.75))
;;   ;; デフォルトフレーム設定 (これだけを設定した場合、起動時フレームもこの設定が使われる)
;;   ;; とりあえず透過度だけ
;;   (setq default-frame-alist
;;         (list (cons 'alpha (cons my-alpha my-alpha))))
;;   ;; 起動時フレーム設定
;;   (setq initial-frame-alist
;;         (list (cons 'top 1)
;;               ;(cons 'left 40)           ; Dock 幅がこれくらい
;;               (cons 'left 1)
;;               (cons 'width 140)
;;               (cons 'height 40)
;;               (cons 'alpha (cons my-alpha my-alpha)))))
;; 起動時フレーム設定
;; Simple is the BEST. 透過も辞めよう．11/02
(setq initial-frame-alist
      (list (cons 'top 1)
            (cons 'left 1)
            (cons 'width 140)
            (cons 'height 40)))



;;;;; Flame Title Bar (p.91)
;; %f = ファイル名，フルパス (buffer-file-name の値)
;; %b = バッファ名 (buffer-name の値)

(setq frame-title-format "%b")
;(abbreviate-file-name buffer-file-name))
;      '(format "%s" (buffer-name)))
      ;(format "%s %s@%s" invocation-name emacs-version system-name))
;; => Emacs 24.3.1@MacBookPro.local

;; !! 注意点 !!
;; buffer-file-name 等は変数なのだが，buffer-name は関数．
;; だから (buffer-name) という感じで使う．
;; 例:
;; buffer-file-name
;; (buffer-name)
;; (abbreviate-file-name buffer-file-name) ;; "~" とかを使って，フルパスを省略してくれる．


;; DELETE 2015/11/02: FROM HERE
;; emacs theme
;; Theme に関してはデフォルトはあんまり好きでないから，変えておこう
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/ir-black-theme-1.0/")
(when window-system
  (load-theme 'ir-black t))
;; TO HERE!!


  ;(load-theme 'ir-black-theme t)
  ;(load-theme 'monokai t))
  ;(setq solarized-high-contrast-mode-line t) ; mode line がキレイ
  ;(load-theme 'solarized-dark t))
