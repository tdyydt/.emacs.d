;; helm

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
;; 縦に画面分割しているときの、
;; Helm buffers の popup の位置の挙動が変わった．
;; とりあえず、応急処置
;; REF: http://emacs.stackexchange.com/questions/19303/split-window-buffers
(setq helm-split-window-in-side-p t)


;; Helm for files の時に現れるソースをカスタマイズ
;; locate を消す．
;; 順番もこのリストに沿うらしい．
;; recentf を最上位にする
;; (しかし，buffer list が先頭のほうが自然)
(setq helm-for-files-preferred-list
      '(helm-source-recentf
        helm-source-buffers-list
        ;helm-source-bookmarks
        helm-source-file-cache
        helm-source-files-in-current-dir
        ;helm-source-locate
        ))
