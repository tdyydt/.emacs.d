;; Time-stamp: <2015-10-27 12:59:21>
;; recentf and recentf-ext.el
(require 'shut-up)

(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")
;; recentf に保存するファイルの数. "nil" を指定すると無限になるとどこかに書いてあった
(setq recentf-max-saved-items 1000)

;; .recentf自体は含まない (更新頻度高いので)
;; "/.emacs.d/backups/" をパスに含むファイルも除外．正規表現を使った． "." はメタ文字でエスケープ必要
;; Git コミットメッセージ編集用ファイルを除外. ".gitignore" とかだと残しておきたいかもだから，".git" ごとにはしなかった
;; 正規表現なのだから ".recentf" ってするとダメだね．"." はメタキャラクタ
(let ((home "/Users/ty/"))
  (setq recentf-exclude (list (concat home "\.emacs\.d/\.recentf")   ; tilde ("~") をちゃんと展開してくれるのか不安 -> やっぱだめ
                              (concat home "\.emacs\.d/backups/.*")
                              ".*/\.git/COMMIT_EDITMSG")))

;; 保存する内容を整理．存在しないファイルをリストから削除したり
(setq recentf-auto-cleanup 10)


;; http://pastelwill.jp/wiki/doku.php?id=emacs:init.el を参考にしたもの
;; shut-up の使い方などよく分かっていない
(defun silent-recentf-save-list ()
  (interactive)
  (let ((message-log-max nil))
    (shut-up (recentf-save-list))))
;; idle 状態なら30秒ごとに .recentf を保存
;; 真偽値は repeat の有無を示す．繰り返す意味ってあるのか？暫く "nil" に変えて様子を見よう．2015/09/10．こうしておけば minibuf へのエコーが煩く感じるのも少しはマシになるんじゃなかろうか？ --->> いや辞めよう
;; これでも気に入らないなら
;; http://pastelwill.jp/wiki/doku.php?id=emacs:init.el
;; http://qiita.com/itiut@github/items/d917eafd6ab255629346
;; をもうちょっと読んで頑張る
;; shut-up.el というのがあるらしい
(run-with-idle-timer 30 t 'silent-recentf-save-list) ;'recentf-save-list)
;(recentf-mode 1)



;; [注意] "recentf-ext" は "recentf" の後に require すること．さもなくば ".recentf" が RESET されちゃう
(require 'recentf-ext)

; C-x C-r は default では "find file READ-ONLY" なのだが使わないかなぁと
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 起動画面で recentf を開く
;(add-hook 'after-init-hook 'recentf-open-files)
