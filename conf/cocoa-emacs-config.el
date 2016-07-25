;; mac specific settings

;; mac で快適に使うための設定
;; キーボード、トラックパッドについて

;; yen -> backslash
;; ¥ (165) の代わりに \ (92) を入力する、ための設定
(define-key global-map [165] [92])
(global-set-key (kbd "C-¥") (kbd "C-\\"))
(global-set-key (kbd "M-¥") (kbd "M-\\"))
(global-set-key (kbd "C-M-¥") (kbd "C-M-\\"))

;; ignore wheel left/right
;; mapcar を使ってみる
(mapcar
 (lambda (key) (global-set-key (kbd key) 'ignore))
 '("<wheel-right>" "<double-wheel-right>" "<triple-wheel-right>"
   "<wheel-left>" "<double-wheel-left>" "<triple-wheel-left>"))

(global-set-key (kbd "<M-down-mouse-1>") nil);'mouse-drag-region)
(global-set-key (kbd "<M-drag-mouse-1>") nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mac でのみ使えるキーバインド設定？

;; disable Cmd-f (search)
(global-set-key (kbd "s-f") nil)

;; Cmd (left)-C-f
;; でフルスクリーン切替
;;(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

;; magit-status
;; cmd-g (git の g ということで)
(global-set-key (kbd "s-g") 'magit-status)
;; stage file
;; (global-set-key (kbd "s-a") 'magit-stage-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IME patch
;; 参考: http://qiita.com/catatsuy/items/886f1e0632c0b2760fb4

;; 現在は mac patch は辞めて、
;; homebrew のを書き換えて、
;; IME patch を当てるようにした、Emacs 24.5 を使っているはず
;; [May 23, 2016]

;; この設定まで線でも、普通にパッチ入れただけでも幸せ。ここまですると、すこしやり過ぎ？と思えて今はこの状態で！
;(setq default-input-method "MacOSX")
;(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")

;; TODO: minibuffer に入る時に 日本語モード オフ


;; REF: http://qiita.com/catatsuy/items/c5fa34ead92d496b8a51
;; IME patch で mac-change-language-to-us 関数が定義されているようだ
;; emacs 起動時は英数モードから始める
(add-hook 'after-init-hook 'mac-change-language-to-us)
;; minibuffer 内は英数モードにする
(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
;; isearch のとき IME を英数モードにする (for migemo)
(add-hook 'isearch-mode-hook 'mac-change-language-to-us)
