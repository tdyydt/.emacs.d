;; auto-complete (p.131)
;; 参考 (最後のほう): http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part9
(when (require 'auto-complete-config nil t)
  ;(add-to-list 'ac-dictionary-directories
  ; "~/.emacs.d/elisp/auto-complete/ac-dict/")
  (global-auto-revert-mode t)
  (setq ac-auto-start 2)
  ;; ac-source-filename というのはファイル名の補完の雰囲気があるが、よく分からない。
  (setq-default ac-sources
                '(ac-source-filename ac-source-words-in-same-mode-buffers))
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
