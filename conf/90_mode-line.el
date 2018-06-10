;; Mode Line

;; ファイルサイズ表示
(size-indication-mode t)
;; 列番号表示
(column-number-mode t)
;; バッテリー残量表示
;; (display-battery-mode t)

;; 時計
;; 最後のスペースは，調整のため。
(setq display-time-string-forms
      ;; '((format "%s %s/%s %s:%s "
      ;;          dayname month day 24-hours minutes))
      '((format "[%s:%s %s/%s %s] "
                24-hours minutes
                month day dayname))
      )
(display-time-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; major, minor mode 表示名を変更する
;; via: http://syohex.hatenablog.com/entry/20130131/1359646452

(require 'cl)
(defvar mode-line-cleaner-alist
  '(;; For minor-mode, first char is 'space'
    (undo-tree-mode . " UT")
    (company-mode . " com")
    (company-coq-mode . " com-coq")

    ;; Major modes
    ;;(python-mode . "py")
    ;;(ruby-mode   . "rb")
    ;;(emacs-lisp-mode . "el")
    ;;(markdown-mode . "md")
    ))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smart modeline
;; via: https://github.com/Malabarba/smart-mode-line#features

;; setup
(sml/setup)

;; because Emacs recommend this to me...
(setq sml/theme 'light)

;; avoid messages
;; (setq sml/no-confirm-load-theme t)

;;;; Pathname abbreviations
;; もとから定義されていたのを上書きする場合は t を付けてはいけない。
;; (add-to-list 'sml/replacer-regexp-list '("^~/Git-Projects/" ":Git:") t)
(add-to-list 'sml/replacer-regexp-list '("^~/Work/" ":Work:"))
(add-to-list 'sml/replacer-regexp-list '("^~/Work/Code/" ":Code:"))
(add-to-list 'sml/replacer-regexp-list '("^~/Work/univ/" ":Univ:"))
(add-to-list 'sml/replacer-regexp-list '("^~/\\.emacs\\.d/" ":Emacs:"))
(add-to-list 'sml/replacer-regexp-list '("^~/Dropbox/" ":DBox:"))
(add-to-list 'sml/replacer-regexp-list '("^~/Downloads/" ":DL:"))
(add-to-list 'sml/replacer-regexp-list '("^~/Work/intro-prog-2018/" ":ip18:"))

;;;; pathname のところの設定
(setq sml/shorten-directory t)
;; pathname の幅
;; (MIN-WIDTH . MAX-WIDTH) で指定するとのこと
;; 最小なし (nil), 最大 44 を意図する。
;; (setq sml/name-width '(nil . 44))

;;;; mode 名のところの設定
(setq sml/shorten-modes t)
;; あまり意味が分からん。mode 名のところが長くなりすぎないようにしたい。
;; 行数とかは左に出てるので、現状どうでもいい。
(setq sml/mode-width 'right)
