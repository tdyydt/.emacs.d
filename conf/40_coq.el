;; proof-general

;; github に書いてある方法で導入
;; via: https://github.com/ProofGeneral/PG
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; TODO: homebrew に変更する

;; Needed:
(setq coq-prog-name "~/.opam/system/bin/coqtop")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-coq
;;(el-get-bundle elpa:company-coq)

;; install by elpa (melpa)

(add-hook 'coq-mode-hook #'company-coq-mode)
