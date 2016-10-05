;; computing and logic

;; proof-general
;; TODO: imaxima 同様もう少しマシな書き方があるか
(load "/usr/local/Cellar/proof-general/4.4/share/emacs/site-lisp/proof-general/site-start.d/pg-init.el")
;; Cellar を探して、init らしきものをロード
;; /usr/local/share/emacs/site-lisp/proof-general
;; に symlink が張られていて、load-path にはいる

(setq coq-prog-name "~/.opam/system/bin/coqtop")
