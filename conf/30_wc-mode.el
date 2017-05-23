(require 'wc-mode)
;; LaTeX ではなくて、すべて小文字らしい
;; describe variable するとハッキリする。
;; (add-hook 'latex-mode-hook 'wc-mode)

;; wc -m に対応していないようなので、日本語文章ではなかなか
;; 使用しづらい

;; (defcustom wc-modeline-format "WC[%W%w/%tw]"
;; の設定を。初期値が "WC[%W%w/%tw]" ということである
;; setq あるいは custom-set-variables を使うそうである
(custom-set-variables '(wc-modeline-format "[%tlL/%tcC]"))
