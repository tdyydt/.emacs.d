;;;;; Key-binds

;; 定番
;; C-h = BS && C-d = del を身につけよ
(global-set-key "\C-h" 'delete-backward-char)

;; dired 関連の操作が割当られてるから注意が必要
;; http://rubikitch.com/2015/03/16/sd1408-ddskk/
(global-set-key (kbd "C-x C-j") 'skk-mode)

;; "C-t" = window切替，"C-x o" でも可能。
(global-set-key (kbd "C-t") 'other-window)
;; 行の折返し表示 ON/OFF
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; indent-region
;; "C-M-\" と書きたいのだが、これを打とうとすると "C-M-¥" と認識するから仕方ない
;(add-hook 'c-mode-hook
;          '(define-key c-mode-map (kbd "C-M-¥") 'indent-region))

;;(define-key scheme-mode-map (kbd "C-M-¥") 'indent-region)

;; キタ！！！これだ．長年の不満が遂に解消された！！！！2015/10/04
;; デフォルトでは "mouse-drag-secondary" というのに割り当てられてたん．．．とにかく感涙！！！
;; TODO: と言いたいのだが，まだ残ってる． "Meta" を押しつつ，何らかのマウス操作をする時なんだけど…
(global-set-key (kbd "<M-down-mouse-1>") 'mouse-drag-region)


;; 行頭で C-a した時に (bolp -> 't)，インデント位置に飛ばす
(defun my-beginning-of-line ()
  (interactive) ;; これは必要みたいだわ
  (if (bolp)
      (back-to-indentation)
      (beginning-of-line)))
(global-set-key "\C-a" 'my-beginning-of-line)

;;;;; マクロ
;(fset 'open-init.el
;   [?\C-x ?\C-f ?\C-a ?\C-  ?\C-e delete ?~ ?/ ?. ?e ?m ?a ?c ?s ?. ?d ?/ ?i ?n ?i ?t ?. ?e ?l return])
