(require 'wc-mode)

;; latex を書く時に有効にする
;; wc -m に対応していないようなので、使いにくいためコメントアウトする。
;; (add-hook 'latex-mode-hook 'wc-mode)

;; wc format
(custom-set-variables '(wc-modeline-format "[%tlL/%tcC]"))
