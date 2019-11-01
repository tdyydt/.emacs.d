;; utility functions

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; compile
;; (Go find Makefile in parent directories)
;; via: https://emacs.stackexchange.com/questions/20954/compile-from-parent-directory-in-emacs
(defun compile-project ()
  (interactive)
  (let* ((mk-dir (locate-dominating-file (buffer-file-name) "Makefile"))
         (compile-command (concat "make -k -C " (shell-quote-argument mk-dir)))
         (compilation-read-command nil))
    (call-interactively 'compile)))

(defun compile-paper ()
  (interactive)
  (let* ((mk-dir "~/Lab/effgrad/popl")
         (compile-command (concat "make -k -C " (shell-quote-argument mk-dir)))
         (compilation-read-command nil))
    (call-interactively 'compile)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Move from *.tex to *.otex
;; Useful when SyncTex with Ott
(defun move-to-otex ()
  "Go to the same line number in the corresponding otex file."
  (interactive)
  (let ((line (line-number-at-pos))
        (otex-file (concat default-directory
                           (file-name-base) ".otex")))
    ;; If it's tex file, and otex-file exists, ...
    (if (and (string= ".tex" (substring (buffer-file-name) -4))
             (file-exists-p otex-file))
        (progn
          (kill-buffer) ;; kill tex buffer
          (find-file otex-file) ;; full path
          (goto-line line))
      (message "Either it's not a tex file; or there's no otex file.")
      )))

;; Memo:
;; (pos (point))
;; (goto-char pos)
;; (buffer-file-name)
;; (buffer-name)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; insert date

;; %Y: year
;; %m: numeric month
;; %b: abbrev month name (ロケール依存？現在、英語設定)
;; %B: full month name
;; %d: day of month

;; insert 関数について
;; via: https://www.gnu.org/software/emacs/manual/html_node/elisp/Insertion.html
(defun insert-format-date ()
  (interactive)
  (insert (format-time-string "%b %d, %Y")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; swap screen

;; 上下あるいは左右のバッファを入れ替える
;; via: http://www.bookshelf.jp/soft/meadow_30.html#SEC403
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

;(global-set-key [f2] 'swap-screen-with-cursor)
(global-set-key [f2] 'swap-screen)
;(global-set-key [S-f2] 'swap-screen-with-cursor)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 千鳥足 emacs
;; via: https://www.kono.cis.iwate-u.ac.jp/~hiki/?%A5%A4%A5%BF%A5%BA%A5%E9%CE%F3%C5%C1
(defun random-walk ()
  (interactive)
  (let ((x (random 4)))
    (cond ((= x 0) (backward-char))
          ((= x 1) (previous-line))
          ((= x 2) (next-line))
          ((= x 3) (forward-char)))))

;; Don't do this...
;; (mapcar (lambda (key)
;;           (define-key global-map key 'random-walk))
;;         '("\C-b" "\C-n" "\C-p" "\C-f"))
