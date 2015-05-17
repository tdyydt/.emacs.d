;; 99_key-binds とかに置いてもいいかなぁと思うものもあるのだが
;; ここへ
;; mac-patch による設定もここで

;; これは IME-patch の機能かねぇ？
;(mac-translate-from-yen-to-backslash)
;; ¥ (165) の代わりに \ (92) を入力する
;; (Mac OS 標準英語キーボードのための設定)
(define-key global-map [165] [92])
(global-set-key (kbd "C-¥") (kbd "C-\\"))
(global-set-key (kbd "M-¥") (kbd "M-\\"))
(global-set-key (kbd "C-M-¥") (kbd "C-M-\\"))

; TODO: IME を柔軟にいじる．モードラインに表示みたいなことは Emacs Mac Port 版では出来ないみたい？
; それは IME-patch であって mac-patch とはまた別ッて感じだろか
; モードラインに？
; (setq default-input-method "MacOSX")
; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

; mode-line に入ったときにアスキーに切替
(mac-auto-ascii-mode t)
;; for mac
;; option key = Meta & command key = super に戻す
;(setq ns-command-modifier (quote super))
;(setq ns-alternate-modifier (quote meta))
(when (eq window-system 'mac)
  (setq mac-option-modifier (quote meta))
  (setq mac-command-modifier (quote super))
  (global-set-key (kbd "s-v") 'yank)           ; paste
  (global-set-key (kbd "s-c") 'kill-ring-save) ; copy
  (global-set-key (kbd "s-m") 'suspend-frame)
  )
