;; AUCTeX ではなくて
;; emacs 標準の TeX-mode を使う、
;; REF: https://texwiki.texjp.org/?Emacs%2FTeX%20mode

;; 便利機能
;; C-c C-o (\begin{...} ... \end{...} の補完)
;; C-c C-e (\end{...} の補完)
;; C-M-m (\item を入力)

;; C-c C-f (タイプセット; latex-run-command が実行される。)
;; C-c C-c (ユーザ定義コマンド; tex-compile-commands から選択)

;; 明示的に書かなくても良いが
(setq tex-default-mode 'latex-mode)

;; C-j が tex 用の段落変えるコマンドになっているので
;; ふつうの C-j に変える
(defun latex-mode-hooks ()
  (define-key tex-mode-map (kbd "C-j") 'electric-newline-and-maybe-indent))
(add-hook 'latex-mode-hook 'latex-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; compile command

;; C-c C-f (タイプセット; latex-run-command が実行される。default=latex)
;; => 無理
;; C-c C-f によるタイプセットは，設定ファイルにおいて
;; latex-run-command（latex-mode の場合．tex-mode の場合は tex-run-command）
;; にセットされたコマンドが実行されます
;; とのことだが効いていない
;; (setq tex-run-command "latexmk")
;; (setq latex-run-command "latexmk")

;; C-c C-c (ユーザ定義コマンド; tex-compile-commands から選択) の設定
;; デフォルトのものは使わないものを書き換えてしまう

;; each element of tex-compile-commands
;; should be of the form (FORMAT IN OUT)
;; FORMAT => command (%f: filename, %r: filename without extension)
;; IN => string, t nil
;; t to indicate that the input is all the TeX files of the document
;; (input を考慮するということか、でなはくて、いつでも、ということ)
;; OUT => 出来上がるファイルの名前 (明示しなく =nil ても良い？)
(setq tex-compile-commands
      '(;;(" latexmk %f && latexmk -c %f" "*.tex" "%r.pdf")
        ;; (" latexmk %f" t "%r.pdf")
        ;;(" latexmk %f && latexmk -c %f" "%f" "%r.pdf")
        (" latexmk %f && \\rm %r.{fls,log,blg}" t "%r.pdf")
        ;; touch, to force rebuild
        ;; touch しても同じ, fdb_latexmk を消せばいい
        (" \\rm %r.fdb_latexmk" "%f" nil)
        ;; ("dvipdfmx %r.dvi" "%r.dvi" "%r.pdf")
        (" platex %f" "%f" "%r.dvi")
        (" open -a Skim.app %r.pdf" "%r.pdf" nil)
        ))
;; latexmk がデフォルト
;; latexmk の後に open という順序になってくれている
;; spc から始めて zsh の履歴に残さない。

;; "latexmk -c" => clean tmp files
;; 自動で clean したのので && を使えばいい
;; REF: http://tex.stackexchange.com/questions/225222/latexmk-cleanup
;; clean すると、aux が消えて、latexmk に
;; ファイルの更新情報が消える。

;; && rm #r.dvi
;; を追加してもいいか
