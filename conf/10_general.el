;; 雑多な設定

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backup
;; backup, auto-save-file を
;; フォルダ ~/.emacs.d/backups/ に集める (p.103)
(add-to-list 'backup-directory-alist
	     (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ビープ音消去
;; ビープ音を visible-bell に変更した上で
;; visible-bell 時に呼び出される関数に
;; その関数に何もしない関数(ignore)を割り当てる
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; C-m と C-j を入れ換えさせない
(electric-indent-mode 0)

;; drag & drop によりファイルを開く
(define-key global-map [ns-drag-file] 'ns-find-file)
(setq ns-pop-up-frames nil)

;; emacs からの質問を y/n で答える (p.30)
;; (fset 'yes-or-no-p 'y-or-n-p)

;; disable startup buffer
(setq inhibit-startup-message t)

;; show confirm dialog when "C-x C-c"
(setq confirm-kill-emacs 'y-or-n-p)


;; Mini-Buf での補完時に大文字小文字の区別をしない
;; (setq completion-ignore-case t) ;古い？
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; avoid confirmation when opening symlink to git-controlled file
(setq vc-follow-symlinks t)

;; 他から変更されたファイルがあったら、再読込する
;; Git 使用時に便利
(global-auto-revert-mode t)

;; disable shift selection
;; via: https://www.gnu.org/software/emacs/manual/html_node/emacs/Shift-Selection.html#Shift-Selection
(setq shift-select-mode nil)

(when window-system                     ; CLI でない場合 (p.65)
  (tool-bar-mode 0)                     ; tool-bar 非表示
  (scroll-bar-mode 0))                  ; scroll-bar


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行番号表示
;; (global-linum-mode)
;; (setq linum-format "%5d")

;; 対応するカッコを点滅
(show-paren-mode t)
;; インデントに TAB を使用しない
(setq-default indent-tabs-mode nil)
;; コメントスタイル (C言語など)
(setq comment-style 'multi-line)

;; default comment start
;; REF:http://stackoverflow.com/questions/15120346/emacs-setting-comment-character-by-file-extension
(setq-default comment-start "# ")

;; 保存時に，行末の余計なスペースを削除
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
;; #! ならば，実行権限付ける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; add newline at EOF when saving a file
;; via: http://www.gnu.org/software/emacs/manual/html_node/emacs/Customize-Save.html
(setq require-final-newline t)
(setq mode-require-final-newline t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dired
(setq dired-auto-revert-buffer t)

;; via: http://www.bookshelf.jp/soft/meadow_25.html#SEC292
(require 'wdired)
;; ファイル名の一括置換に便利
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cua-mode
;; 矩形選択 "C-RET"
;; (cua-mode t)
;; (setq cua-enable-cua-keys nil)

;; uniquify
;; バッファ名が重複した時のバッファ名の区別の方法を変える
;; default: 数字が付く
(require 'uniquify)
(setq uniquify-buffer-name-style
      'post-forward-angle-brackets)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Major mode

;; ott-tex
(add-to-list 'auto-mode-alist '("\\.otex\\'" . LaTeX-mode))
;; racket
(add-to-list 'auto-mode-alist '("\\.grift\\'" . scheme-mode))

;; NOTE: example of file variable
;; -*- mode: org-*-
