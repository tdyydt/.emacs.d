;; helm
;;(el-get-bundle async)

(require 'helm-config)

;; helm-descbinds (キーバインド一覧)
;; "describe-bindings" (C-h b) を helm interface に置換え
(when (require 'helm-descbinds nil t)
  (helm-descbinds-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; overwrite "find file READ-ONLY"
(global-set-key (kbd "C-x C-r") 'helm-for-files)

;; replace emacs file commands with Helm version:
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)


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
