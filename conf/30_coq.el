;; computing and logic

;; proof-general
;;(el-get-bundle proof-general)

;; el-git による導入は上手くいかないので、一旦諦める。
;; github に書いてある方法に従う。
;; via: https://github.com/ProofGeneral/PG
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; needed
(setq coq-prog-name "~/.opam/system/bin/coqtop")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-coq
;;(el-get-bundle elpa:company-coq)

;; install by elpa (melpa)

(add-hook 'coq-mode-hook #'company-coq-mode)
