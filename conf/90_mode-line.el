;; Mode Line

;; ファイルサイズ表示
(size-indication-mode t)
;; 列番号表示
(column-number-mode t)
;; バッテリー残量表示
;; (display-battery-mode t)

;; 時計
(setq display-time-string-forms
      ;; quote に注意
      ;; 最後のスペースは，調整のため。
      ;; '((format "%s %s/%s %s:%s "
      ;;          dayname month day 24-hours minutes)))
      '((format "(%s:%s %s/%s %s) "
                24-hours minutes
                month day dayname
               )))
(display-time-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; major, minor mode 表示名を変更する
;; REF: http://syohex.hatenablog.com/entry/20130131/1359646452

(require 'cl)
(defvar mode-line-cleaner-alist
  '(;; For minor-mode, first char is 'space'
    (undo-tree-mode . " UT")

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
;; smart-mode-line & power-line
;; REF: http://emacs.stackexchange.com/questions/281/how-do-i-get-a-fancier-mode-line-that-uses-solid-colors-and-triangles

;; REF: http://blog.shibayu36.org/entry/2014/04/01/094543
;; REF: http://blog.shibayu36.org/entry/2014/02/02/192924

;; なくても良さげ
;; (require 'smart-mode-line)

;; powerline には
;; いくつか変種があるとのこと
;; REF: https://www.emacswiki.org/emacs/PowerLine

;; setup powerline
(require 'powerline)
;; theme とは、モードラインの並び順ということ。
;; powerline-themes に定義されている
(powerline-default-theme)
;(powerline-center-theme)

;; set separator:
;; nil, bar, curve, ...
(setq powerline-default-separator 'curve)
;; curve とかにするときに、綺麗にセパレータが表示されない
;; REF: http://ytsk.hatenablog.com/entry/2015/09/23/021856
;; (setq ns-use-srgb-colorspace nil)
;; とすれば出来るけど、過激な方法とのこと, nil にするのが最も手っ取り早い

;; 色はコレを参考に
;; REF: http://blog.shibayu36.org/entry/2014/02/11/160945
;; color name list
;; REF: http://raebear.net/comp/emacscolors.html

;; for active window:
(progn
  (set-face-attribute 'mode-line nil
                      :foreground "Brack"
                      :background "violet"
                      :box nil)
  ;; major-mode, minor-mode のところ
  (set-face-attribute 'powerline-active1 nil
                      :foreground "Brack"
                      :background "White"
                      :inherit 'mode-line)
  ;; 時計とかのところ
  (set-face-attribute 'powerline-active2 nil
                      :foreground "Brack"
                      ;; :background "chocolate"
                      :background "DarkOrange"
                      :inherit 'mode-line))

;; for inactive windows:
(let ((bg-color "gray20")
      (fg-color "White"))
  (set-face-attribute 'mode-line-inactive nil
                      :foreground fg-color
                      :background bg-color
                      :box nil)
  (set-face-attribute 'powerline-inactive1 nil
                      :foreground fg-color
                      :background bg-color
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-inactive2 nil
                      :foreground fg-color
                      :background bg-color
                      :inherit 'mode-line))
