;; mac specific settings

;; mac で快適に使うための設定
;; キーボード、トラックパッドについて

;; yen -> backslash
;; ¥ (165) の代わりに \ (92) を入力するための設定
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

;; LeftCmd (super) + Ctrl + f
;; でフルスクリーン切替
;;(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
(global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IME patch
;; via: http://qiita.com/catatsuy/items/886f1e0632c0b2760fb4
;; via: http://qiita.com/catatsuy/items/c5fa34ead92d496b8a51

;; IME patch で、mac-change-language-to-us 関数が定義されている
;; この関数が定義されてるときのみ、各種 hook に追加する
;; via: http://ergoemacs.org/emacs/elisp_check_defined.html

(when (fboundp 'mac-change-language-to-us)
  ;; emacs 起動時は en から始める
  (add-hook 'after-init-hook 'mac-change-language-to-us)
  ;; minibuffer 内は en にする
  (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
  ;; isearch のとき IME を en にする (for migemo)
  (add-hook 'isearch-mode-hook 'mac-change-language-to-us))
