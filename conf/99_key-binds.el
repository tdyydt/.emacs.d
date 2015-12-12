;;;;; Key-binds

;; "C-h"
;(global-set-key "\C-h" 'delete-backward-char)
;; REF: http://qiita.com/takc923/items/e279f223dbb4040b1157
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

;; dired 関連の操作が割当られてるから注意が必要
;; http://rubikitch.com/2015/03/16/sd1408-ddskk/
(global-set-key (kbd "C-x C-j") 'skk-mode)

;; "C-t" = window切替，"C-x o" でも可能。
(global-set-key (kbd "C-t") 'other-window)
;; 行の折返し表示 ON/OFF
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; C-c C-a = align-regexp
;; C-c a   = alin
;; なんてのもありである。
;; nil にすると割り当てリセット。Undefined になる
(global-set-key (kbd "C-c a") 'align-regexp)

;; あまり使わないし 'C-x b' とよく間違えるので
(global-set-key (kbd "C-x C-b") nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行頭で C-a した時に (bolp -> 't)，
;; indent の先頭に移動する
(defun my-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
      (beginning-of-line)))
(global-set-key "\C-a" 'my-beginning-of-line)
