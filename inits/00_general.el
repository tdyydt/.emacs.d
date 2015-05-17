;; backup, auto-save-file をフォルダ ~/.emacs.d/backups/ に集める (p.103)
(add-to-list 'backup-directory-alist
	     (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;; ビープ音消去
;; ビープ音を visible-bell に変更 & visible-bell 時に呼び出される関数は変更することができるので，その関数に何もしない関数(ignore)を割り当てる
(setq visible-bell t)
(setq ring-bell-function 'ignore)


;; C-m と C-j の挙動を入れ換えるというクソみたいな設定を OFF に．
;; これがデフォルトで ON になってるとか終わってるよ．Emacs version を新しくして仕様変更に苦しめられたという訳．
(electric-indent-mode 0)


;; drag & drop によりファイルを開く
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

(when window-system                     ; CLI でない場合 (p.65)
  (tool-bar-mode 0)                     ; tool-bar 非表示
  (scroll-bar-mode 0))                  ; scroll-bar

;; やめる 11/02
;; 行番号表示
;(global-linum-mode)
;(setq linum-format "%5d")

;; 対応するカッコを点滅
(show-paren-mode t)
;; インデントに TAB を使用しない
(setq-default indent-tabs-mode nil)
;; コメントスタイル (C言語など)
(setq comment-style 'multi-line)
;; 保存時に，行末の余計なスペースを削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; emacs からの質問を y/n で答える (p.30)
(fset 'yes-or-no-p 'y-or-n-p)

;; 起動画面なんていらない！
(setq inhibit-startup-message t)

;; C-x C-c を押した時に確認してもらう
(setq confirm-kill-emacs 'y-or-n-p)


;; Mini-Buf での補完時に大文字小文字の区別をしない
; (setq completion-ignore-case t) 古い？
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)


;; avoid confirmation when opening symbolic link to git-controlled file
(setq vc-follow-symlinks t)
