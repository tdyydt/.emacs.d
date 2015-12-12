;;;;; Helm (Anything)
(require 'helm-config)

;; helm-descbinds (キーバインド一覧)
;; "describe-bindings" (C-h b) を helm interface に置換え
(when (require 'helm-descbinds nil t)
  (helm-descbinds-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; Note: "C-x C-r" is bound to "find file READ-ONLY" by default.
(global-set-key (kbd "C-x C-r") 'helm-for-files)

;; Emacs 標準コマンドを Helm 版に置き換える:
;; 参考: http://d.hatena.ne.jp/a_bicky/20140104/1388822688
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)

;(define-key helm-map (kbd "C-h") 'delete-backward-char)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; issue:
;; 縦に画面分割しているときに、
;; Helm buffers の popup の表示が嫌だ。変えたい
;; Helm の update をしたせいか、変わった。
;; とりあえず、応急処置
;; REF: http://emacs.stackexchange.com/questions/19303/split-window-buffers
(setq helm-split-window-in-side-p t)


;; Helm for files をした時に現れるソースをカスタマイズ
;; locate 要らないので。
;; 順番もこのリストに沿うみたいなので、
;; helm-recentf の代わりに使うのだという意味で、
;; recentf を最上位にする (buffer list が先頭のほうが自然ではあるが)
(setq helm-for-files-preferred-list
      '(helm-source-recentf
        helm-source-buffers-list
        ;helm-source-bookmarks
        helm-source-file-cache
        helm-source-files-in-current-dir
        ;helm-source-locate
        ))
