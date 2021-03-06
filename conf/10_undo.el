;; Undo & Redo

;; undo-tree (p.138)
;; d = diff
(when (require 'undo-tree nil t)
  (global-undo-tree-mode)
  ;; redo
  (global-set-key (kbd "C-.") 'undo-tree-redo))

;; redo+ は使わず，undo-tree で redo する
;; (redo+ は package.el で入らない)
;; via: https://qiita.com/takc923/items/c3d64b55fc4f3a3b0838

;; point-undo (p.140)
(when (require 'point-undo nil t)
  (define-key global-map [f5] 'point-undo)
  (define-key global-map [f6] 'point-redo))

;; ==> install by hand & byte compile
;; via: https://www.emacswiki.org/emacs/point-undo.el
;; melpa にはない

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; undohist
(when (require 'undohist nil t)
  (undohist-initialize))

;; ignore
;; files for editing commit message (git)
;; (add-to-list 'undohist-ignored-files ".+COMMIT_EDITMSG.*")

;; Tuning:
;; Advice undohist-recover
;; not to ask wheter you recover the file
;; REF: http://d.hatena.ne.jp/odz/20060911/1157995745
;; REF: http://d.hatena.ne.jp/higepon/20060912/1158057702
;; REF: http://www.bookshelf.jp/texi/elisp-manual-20-2.5-jp/elisp_17.html

(defadvice yes-or-no-p
    ;; class (= before/after/around),
    ;; name of advice, ... を指定
    (around yes-or-no-p--force-no)
  "yes-or-no-p returns no without any dialogue"
  (setq ad-return-value nil))

;; ad-do-it: 関数の元定義の実行
;; (around でこれを呼ばない場合、元の関数は完全無視される)
;; undohist-recover-safe が undohist.el の中で
;; find-file に hook されている関数
(defadvice undohist-recover-safe
    ;; why activate??
    (around undohist-recover--avoid-dialogue activate)
  (ad-activate-regexp "yes-or-no-p--force-no")
  ad-do-it
  (ad-deactivate-regexp "yes-or-no-p--force-no"))

;; アドバイスを activate する方法の違い
;; ad-active: アドバイスされる関数
;; ad-active-regexp: アドバイスの名前
(ad-activate-regexp "undohist-recover--avoid-dialogue")
