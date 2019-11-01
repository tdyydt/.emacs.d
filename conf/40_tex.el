;; latex-mode
;; AUCTeX に変更？

(setq tex-default-mode 'latex-mode)

;; C-j が tex 用の段落変えるコマンドになっているので
;; ふつうの C-j に変える
(defun my-latex-mode-hooks ()
  (define-key tex-mode-map
    (kbd "C-j") 'electric-newline-and-maybe-indent))
(add-hook 'latex-mode-hook 'my-latex-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; compile command

;; C-c C-c
;; (ユーザ定義コマンド; tex-compile-commands から選択)

;; デフォルトは使わないものも多いため、書き換える

;; zsh の履歴に残さないために，先頭に spc を加える

(setq tex-compile-commands
      '(;; 一番上に置いておく
        ;; 不要な一時ファイルを消す。
        (" latexmk %r.tex && \\rm %r.{fls,log,blg}" t "%r.pdf")

        ;; 強制的に再コンパイルしたい時に使うと良い。
        ;; touch だけでは意味がなくて、fdb_latexmk を消せば良い
        (" \\rm %r.fdb_latexmk" "%f" nil)

        (" platex %f" "%f" "%r.dvi")
        (" open -a Skim.app %r.pdf" "%r.pdf" nil)  ;; only for mac
        ))

;; Each element of tex-compile-commands
;; should be of the form (FORMAT IN OUT)

;; FORMAT:
;; command (%f: filename, %r: filename without extension)

;; IN: string, t nil
;; t to indicate that the input is all the TeX files of the document
;; (input を考慮するということか、でなはくて、いつでも、ということ)

;; OUT:
;; 出来上がるファイルの名前 (明示しなく =nil ても良い？)
