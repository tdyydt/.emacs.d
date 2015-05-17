;; uniquify (emacs同梱)
;; バッファ名が重複した時のバッファ名の区別の方法を変える (default だと数字になる)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
