;; ac-math
;(require 'ac-math)
;; auto-complete に latex-mode の存在を知らせる
;(add-to-list 'ac-modes 'latex-mode)
;; add ac-sources to default ac-sources
;(defun ac-latex-mode-setup ()
;  (setq ac-sources
;     (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
;               ac-sources)))
;(add-hook 'TeX-mode-hook 'ac-latex-mode-setup)


;; auto-complete-LaTeX
;; URL: http://d.hatena.ne.jp/tequilasunset/20100424/p1
;; latex-help (ac-l-dict フォルダ) は削除済, ヘルプを出なくした。汚いので
(when (require 'auto-complete-latex nil t)
   (setq ac-l-dict-directory "~/.emacs.d/elisp/auto-complete-latex/ac-l-dict/")
   (add-to-list 'ac-modes 'latex-mode)
   (add-hook 'LaTeX-mode-hook 'ac-l-setup))



;;;;; AUCTeX

;; require 要らないの？
;(require 'tex)

;(with-eval-after-load "tex-jp"
;  (setq TeX-command-default 'pLaTeX))

; これが聞かないのは，このコードの後に，tex.el により値が書き換えられているからのはず

;; (require 'latex)
;(when (and (require 'tex-site nil t) (require 'tex nil t))
;  (setq TeX-parse-self t)
;  (setq TeX-parse-self t)
;  (setq font-latex-fontify-script nil)
;; (setq TeX-default-mode 'japanese-latex-mode)
;; (setq japanese-LaTeX-command-default "pLaTeX") ; 効いていない！！！！！
;; どう足掻いても効かない。わけわかめ
;  (setq TeX-default-mode 'japanese-latex-mode)
;  (setq japanese-LaTeX-command-default "pLaTeX") ; やはり効かない
;  (setq LaTeX-command-default "pLaTeX")
;  (setq japanese-TeX-command-default "pLaTeX"))

;; hook (p.105)
;; add-hook の引数に lambda 式を書く方法もあるようだが、それより以下の書き方がいいらしい。
;; これに関しては効いてるみたいだなぁ
(defun LaTeX-mode-hooks ()
  (add-to-list 'TeX-command-list
               '("pdf" "dvipdfmx %s" TeX-run-command t nil)) ; %s は，現在開いているバッファから取得したファイル名
  ;(setq TeX-command-default "pLaTeX")
  )
(add-hook 'LaTeX-mode-hook 'LaTeX-mode-hooks)
