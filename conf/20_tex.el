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
(defun latex-mode-hooks ()
  (define-key tex-mode-map (kbd "C-j") 'electric-newline-and-maybe-indent))
(add-hook 'latex-mode-hook 'latex-mode-hooks)

;; TODO:
;; latex-XXX か tex-XXX か
;; どちらを使うべきなのか、いつも迷う

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-c C-f (タイプセット; latex-run-command が実行される。default=latex)
;; => 無理
;; C-c C-f によるタイプセットは，設定ファイルにおいて
;; latex-run-command（latex-mode の場合．tex-mode の場合は tex-run-command）
;; にセットされたコマンドが実行されます
;; とのことだが効いていない
;; (setq tex-run-command "latexmk")
;; (setq latex-run-command "latexmk")

;; C-c C-c (ユーザ定義コマンド; tex-compile-commands から選択) の設定
;; デフォルトのものは使わないものが多いので
;; 書き換えてしまう
;; 先頭のものほど、優先度が高いようだ

;; each element of tex-compile-commands should be:
;; of the form (FORMAT IN OUT)
;; FORMAT => command (%f: filename, %r: filename without extension)
;; IN => string, t nil
;; OUT => 出来上がるファイルの名前 (明示しなく =nil ても良い？)
(setq tex-compile-commands
      '(("latexmk %f && latexmk -c %f" "%f" "%r.pdf")
        ("dvipdfmx %r.dvi" "%r.dvi" "%r.pdf")
        ("platex %f" "%f" "%r.dvi")
        ("open -a Skim.app %r.pdf" "%r.pdf" nil)
        ;; clean temp files
        ;;("latexmk -c" t nil)
        ))

;; 自動で clean したのので && を使えばいい
;; REF: http://tex.stackexchange.com/questions/225222/latexmk-cleanup


;; C-c C-v にバインドされている
;; tex-view 関数の書き換え (少し強引) --> 効かない
;; TODO: my-tex-view を C-c C-v に re-bind
;; (defun tex-view ()
;;   (interactive)
;;   ;; tex shell にコマンドを送る (?)
;;   ;; tex-print-file は編集中の tex ファイルのパス
;;   (tex-send-command "/usr/bin/open -a Skim.app"
;;                     (tex-append tex-print-file ".pdf")))
