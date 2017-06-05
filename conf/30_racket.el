;; racket config

;; Geiser
;; Geiser is an Emacs environment to hack and have fun in Scheme.
(el-get-bundle elpa:geiser)
(require 'geiser)

(setq geiser-racket-binary "racket")
(setq geiser-active-implementations '(racket))
;(setq geiser-repl-read-only-prompt-p nil)


;; autodoc mode が煩いから、止める
;; (setq geiser-mode-autodoc-p nil)

(defun my-geiser-mode-hooks ()
  ;; 'C-.' で redo したいので、解除
  (define-key geiser-mode-map (kbd "C-.") nil))
(add-hook 'geiser-mode-hook 'my-geiser-mode-hooks)

;; REPL は
;; geiser-repl
;; というモード。コレの起動時に
;; geiser-autodocsetq -mode
;; が付いてしまう

;; defcustom でサーチするといい
;; finally found @geiser-repl.el
(setq geiser-repl-autodoc-p nil)
;; 通常の rkt 編集時モードも同様
;; autodoc-mode 有りだと 'Racket/A' となる
(setq geiser-mode-autodoc-p nil)

;; geiser-racket-init-file
;; に設定されている文字列ファイルが、racket 起動時に実行される
;; 初期値のままだが明示的に書いておく
(setq geiser-racket-init-file "~/.racket-geiser")
