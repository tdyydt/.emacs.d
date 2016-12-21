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
(add-to-list 'sml/replacer-regexp-list '("^~/Documents/Code/" ":Code:"))
(add-to-list 'sml/replacer-regexp-list '("^~/Documents/KU/" ":KU:"))
;; ED => Emacs
(add-to-list 'sml/replacer-regexp-list '("^~/\\.emacs\\.d/" ":Emacs:"))
(add-to-list 'sml/replacer-regexp-list '("^~/Dropbox/" ":DBox:"))


;;;; pathname のところの設定
(setq sml/shorten-directory t)
;; pathname の幅
;; (MIN-WIDTH . MAX-WIDTH) で指定するとのこと
;; 最小なし (nil), 最大 44 を意図する。
(setq sml/name-width '(nil . 44))

;;;; mode 名のところの設定
(setq sml/shorten-modes t)
;; あまり意味が分からん。mode 名のところが長くなりすぎないようにしたい。
;; 行数とかは左に出てるので、現状どうでもいい。
(setq sml/mode-width 'right)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; powerline
;; via: http://emacs.stackexchange.com/questions/281/how-do-i-get-a-fancier-mode-line-that-uses-solid-colors-and-triangles
;; via: http://blog.shibayu36.org/entry/2014/04/01/094543
;; via: http://blog.shibayu36.org/entry/2014/02/02/192924

;; ;; なくても良さげ
;; ;; (require 'smart-mode-line)

;; ;; powerline には
;; ;; いくつか変種があるとのこと
;; ;; via: https://www.emacswiki.org/emacs/PowerLine

;; ;; setup powerline
;; (require 'powerline)

;; ;; powerline-themes に定義されている
;; (powerline-default-theme)
;; ;(powerline-center-theme)

;; ;; set separator:
;; ;; nil, bar, curve, ...
;; ;; あまり綺麗に表示されない
;; ;; via: http://ytsk.hatenablog.com/entry/2015/09/23/021856
;; (setq powerline-default-separator 'curve)
;; ;; ファイルのどの位置にいるかの、示すバーを表示するか
;; ;;(setq powerline-display-hud t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 色はコレを参考に
;; via: http://blog.shibayu36.org/entry/2014/02/11/160945
;; color name list
;; via: http://raebear.net/comp/emacscolors.html

;; ;; for active window:
;; (progn
;;   (set-face-attribute 'mode-line nil
;;                       :foreground "Brack"
;;                       :background "violet"
;;                       :box nil)
;;   ;; major-mode, minor-mode のところ
;;   (set-face-attribute 'powerline-active1 nil
;;                       :foreground "Brack"
;;                       :background "White"
;;                       :inherit 'mode-line)
;;   ;; 時計とかのところ
;;   (set-face-attribute 'powerline-active2 nil
;;                       :foreground "Brack"
;;                       ;; :background "chocolate"
;;                       :background "DarkOrange"
;;                       :inherit 'mode-line))

;; ;; for inactive windows:
;; (let ((bg-color "gray20")
;;       (fg-color "White"))
;;   (set-face-attribute 'mode-line-inactive nil
;;                       :foreground fg-color
;;                       :background bg-color
;;                       :box nil)
;;   (set-face-attribute 'powerline-inactive1 nil
;;                       :foreground fg-color
;;                       :background bg-color
;;                       :inherit 'mode-line)
;;   (set-face-attribute 'powerline-inactive2 nil
;;                       :foreground fg-color
;;                       :background bg-color
;;                       :inherit 'mode-line))
