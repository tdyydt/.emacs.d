;; Mode Line (p.88)

;; ファイルサイズ表示
(size-indication-mode t)
;; 列番号表示
(column-number-mode t)

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

;; バッテリー残量表示
;; (display-battery-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 選択中の行数と文字数を表示 (p.89)
;; 不要 2015/11/02

;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format "%d lines, %d chars "
;;               (count-lines (region-beginning) (region-end))
;;               (- (region-end) (region-beginning)))
;;     ""))

;; (defun count-marked-chars ()
;;   (if mark-active
;;       (format "%d chars "
;;               (- (region-end) (region-beginning)))
;;     ""))
;; (add-to-list 'default-mode-line-format
;;              '(:eval (count-marked-chars)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smart-mode-line
;; REF: http://emacs.stackexchange.com/questions/281/how-do-i-get-a-fancier-mode-line-that-uses-solid-colors-and-triangles

;; REF: http://blog.shibayu36.org/entry/2014/04/01/094543
;; REF: http://blog.shibayu36.org/entry/2014/02/02/192924

;; TOOD: 設定方法が分からない
;; 現状、色が見づらい。dark にマッチしない

(require 'smart-mode-line)
(require 'powerline)

;; arrow, curve, ..
(setq powerline-arrow-shape 'arrow)
;(setq powerline-default-separator-dir '(right . left))
(powerline-default-theme)
;(powerline-center-theme)

;; These two lines you really need.
;(setq sml/theme 'powerline)
;; TODO: これを呼ぶと warning が出るのを何とかする
(sml/setup)

;; (set-face-attribute 'mode-line nil
;;                     :foreground "Black"
;;                     :background "DarkOrange"
;;                     :box nil)

;; 色はコレを参考に
;; REF: http://blog.shibayu36.org/entry/2014/02/11/160945

;; foreground (文字色) を変えても変わらないものもおおい

;; color name list
;; REF: http://raebear.net/comp/emacscolors.html

;; for active window:
(progn
  (set-face-attribute 'mode-line nil
                      :foreground "Brack"
                      :background "DarkOrange"
                      :box nil)
  ;; major-mode, minor-mode のところ
  (set-face-attribute 'powerline-active1 nil
                      :foreground "Brack"
                      :background "White"
                      :inherit 'mode-line)
  ;; 時計とかのところ
  (set-face-attribute 'powerline-active2 nil
                      :foreground "Brack"
                                        ;:background "chocolate"
                      :background "violet"
                      :inherit 'mode-line))

;; for inactive windows:
(progn
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "Brack"
                      :background "White"
                      :box nil)
  (set-face-attribute 'powerline-inactive1 nil
                      :foreground "Brack"
                      :background "White"
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-inactive2 nil
                      :foreground "Brack"
                      :background "White"
                      :inherit 'mode-line))
