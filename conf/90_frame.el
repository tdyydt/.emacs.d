;; customize

;; 透過度
;; ("0"→もっとも透明)
;; Windows: alpha = 88
;; Mac: alpha = 75 ~ 80
;; alpha = 0.80
;; solarized (dark) だと 0.85 くらい

;; frame size/position
(when (or (eq window-system 'ns)
          (eq window-system 'mac))
  (setq initial-frame-alist
        '((top . 1)
          (left . 1)
          (width . 160)
          (height . 40)
          (alpha . (0.80 . 0.80)))))

;; initial-frame だけ変えているが、特に問題は感じない。
;; default-frame もある。

;; issue:
;; フレームを増やすことはあまりないが、
;; default だけ設定すると、良いようなのだが、フレームを増やした時に、
;; そちらのフレームではスクロールバーが出たりする。


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; frame title
;; %f = ファイル名，フルパス (buffer-file-name の値)
;; %b = バッファ名 (buffer-name の値)

(setq frame-title-format "%b")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; face/theme

;; simple: dark mode
;; (when window-system (invert-face 'default))

;; solarized
;; via: http://ethanschoonover.com/solarized
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/themes/emacs-color-theme-solarized")
;; toggle light/dark
;; (setq frame-background-mode 'light)
;; (load-theme 'solarized t)

;; zenburn
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/themes/zenburn-emacs")
;; (load-theme 'zenburn t)

;; Dracula
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/themes/dracula-emacs")
;; (load-theme 'dracula t)

;; monokai
(add-to-list 'custom-theme-load-path
             "~/.emacs.d/themes/monokai-emacs")
;; (load-theme 'monokai t)

;; built-in themes
;;(load-theme 'manoj-dark t)
;;(load-theme 'deeper-blue t)
(load-theme 'wombat t)
