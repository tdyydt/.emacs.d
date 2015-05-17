;;;;; Mode Line (p.88)

;; ファイルサイズ表示
(size-indication-mode t)
;; 列番号表示
(column-number-mode t)

;; 時計
(setq display-time-string-forms
      ;; quote に注意
      ;; 最後のスペースは，調整のため。
      '((format "%s %s/%s %s:%s "
               dayname month day 24-hours minutes)))
(display-time-mode t)

;; バッテリー残量表示
;; (display-battery-mode t)

;; 選択中の行数と文字数を表示 (p.89)
;; (defun count-lines-and-chars ()
;;   (if mark-active
;;       (format "%d lines, %d chars "
;;               (count-lines (region-beginning) (region-end))
;;               (- (region-end) (region-beginning)))
;;     ""))

;; 不要 2015/11/02
;; (defun count-marked-chars ()
;;   (if mark-active
;;       (format "%d chars "
;;               (- (region-end) (region-beginning)))
;;     ""))
;; (add-to-list 'default-mode-line-format
;;              '(:eval (count-marked-chars)))
