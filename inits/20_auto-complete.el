;; auto-complete (p.131)
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/elisp/auto-complete/ac-dict/")
  (setq ac-auto-start 2)
  (setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
  (setq ac-ignore-case nil)             ; 大文字小文字を区別する
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-set-trigger-key "TAB")                             ; 状況により TAB をインデントだけでなく，補完にも割り当てる
  (ac-config-default))

;; auto-complete の候補に日本語を含む単語が含まれないようにする
;; http://d.hatena.ne.jp/IMAKADO/20090813/1250130343
(defadvice ac-word-candidates
    (after remove-word-contain-japanese activate)
  (let ((contain-japanese
         (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))
