;; original functions
;; utility functions

;; TODO: [May 24, 2016]
;; my- という prefix を付けることで、カスタマイズ関数を
;; 明確にしておく。"M-x my-" で探しやすくしておくのも、
;; 場合によっては悪くないのかもしれない。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; insert date

;; %Y: year
;; %m: numeric month
;; %b: abbrev month name (ロケール依存？現在、英語設定)
;; %B: full month name
;; %d: day of month

;; insert 関数について
;; REF: https://www.gnu.org/software/emacs/manual/html_node/elisp/Insertion.html
(defun insert-format-date ()
  (interactive)
  (insert (format-time-string "%b %d, %Y")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; update expense manager

;; for string-trim
;; REF: http://ergoemacs.org/emacs/elisp_trim_string.html
(require 'subr-x)

;; 関連する関数:
;; call-process
;; call-process-shell-command (シェルコマンドを指定したいとき)
;; shell-command-to-string (シェルコマンドの出力を利用するとき)
(defun update-expense ()
  "update my expense manager"
  (interactive)
  (let ((output
         (shell-command-to-string ;call-process-shell-command
          "(cd ~/Documents/Code/ExpenseManager; ./main.py --without-show)")))
    (message (string-trim output))))

(defun open-expense ()
  "open my expense manager (data.html of current year)"
  (interactive)
  (let ((output
         (shell-command-to-string ;call-process-shell-command
          (format-time-string
           ;;"(cd ~/Documents/Code/ExpenseManager/output/; open %Y_data.html)"
           "(cd ~/Documents/Code/ExpenseManager/output/; open index.html)"
           ))))
    (message (string-trim output))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; replace
;; fix single quote
;; illegal
;; 選択範囲の region の中の buffer で
;; ’
;; を
;; '
;; に置き換える。
;; (replace-string "’" "'")
;; を関数にして使いやすくする。TODO:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 以下、ネットに転がっていた便利関数たち

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; swap screen

;; 上下あるいは左右のバッファを入れ替えることができます
;; Ref: http://www.bookshelf.jp/soft/meadow_30.html#SEC403
(defun swap-screen ()
  "Swap two screen, leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor ()
  "Swap two screen, with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))

;; 無理だ, 使いにくそうだし辞め
;; (defun selective-swap-screen (n)
;;   (interactive "p")
;;   (if (= n 0)
;;       (swap-screen)
;;     (swap-screen-with-cursor)))

;(global-set-key [f2] 'swap-screen-with-cursor)
(global-set-key [f2] 'swap-screen)
;(global-set-key [S-f2] 'swap-screen-with-cursor)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 千鳥足 emacs
;; おもしろい。コードが簡単で良い。
;; REF: https://www.kono.cis.iwate-u.ac.jp/~hiki/?%A5%A4%A5%BF%A5%BA%A5%E9%CE%F3%C5%C1
(defun random-walk ()
  (interactive)
  (let ((x (random 4)))
    (cond ((= x 0) (backward-char))
          ((= x 1) (previous-line))
          ((= x 2) (next-line))
          ((= x 3) (forward-char)))))
;; "C-b" 系の4つの key を全て、random-walk に割り当ててしまう
;; (mapcar = scheme の map)
;; 実用度 0 !!
;; (mapcar (lambda (key)
;;           (define-key global-map key 'random-walk))
;;         '("\C-b" "\C-n" "\C-p" "\C-f"))
