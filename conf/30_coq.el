;; computing and logic

;; proof-general
;; TODO: imaxima 同様もう少しマシな書き方があるか
(load "/usr/local/Cellar/proof-general/4.4/share/emacs/site-lisp/proof-general/site-start.d/pg-init.el")
;; Cellar を探して、init らしきものをロード
;; /usr/local/share/emacs/site-lisp/proof-general
;; に symlink が張られていて、load-path にはいる

;; needed
(setq coq-prog-name "~/.opam/system/bin/coqtop")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; plugin
;; company-coq
(el-get-bundle company-coq)
(add-hook 'coq-mode-hook #'company-coq-mode)

;; Company coq で minor mode が増えすぎる。
;; (defun company-coq-mode-hooks ()
;;   ;; なんだかんだ補完の時に yas も無いと、変な挙動になる。
;;   ;; (yas-minor-mode 0)
;;   ;; Hide/Show
;;   (hs-minor-mode 0))
;; (add-hook 'company-coq-mode-hook 'company-coq-mode-hooks)
