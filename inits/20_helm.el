;;;;; Helm (Anything)
(require 'helm-config)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;;(global-set-key (kbd "C-x C-b") 'helm-for-files)

;; helm-descbinds (キーバインド一覧)
;; "describe-bindings" (C-h b) を helm interface に置換え
(require 'helm-descbinds)
(helm-descbinds-mode)
