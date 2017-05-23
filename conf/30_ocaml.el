;; OCaml
;; tuareg mode
(el-get-bundle tuareg)

;; いつも "ocaml" を起動するだけで十分なので、
;; 関数定義を上書き。あまり綺麗でない
;; (defun tuareg-run-ocaml ()
;;   "Run an OCaml toplevel process.  I/O via buffer `*ocaml-toplevel*'."
;;   (interactive)
;;   (tuareg-run-process-if-needed "ocaml")
;;   (display-buffer tuareg-interactive-buffer-name))

;; .ml, .mli, .mly, .mll, and .mlp
;; via: https://www.emacswiki.org/emacs/AutoModeAlist
(add-to-list 'auto-mode-alist
             '("\\.ml[iylp]?\\'" . tuareg-mode))


;; customize function indentation
;; via: https://github.com/ocaml/tuareg#customization
(setq tuareg-indent-align-with-first-arg nil)
