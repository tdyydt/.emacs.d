;; REF: http://ergoemacs.org/emacs/emacs_auto-activate_a_major-mode.html
;; 特定のファイルを、特定の major mode で開く
;; Emacs Regexp: http://ergoemacs.org/emacs/emacs_regex.html

(add-to-list 'auto-mode-alist
             '("[Rr]eadme" . org-mode))

;; 行頭に
;; -*- mode: org-*-
;; と書いておけば、org-mode で開くという
;; file variable というものもあるらしい
