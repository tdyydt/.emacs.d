;; OCaml
;; tuareg mode

;; いつも "ocaml" を起動するだけで十分なので、
;; 関数定義を上書き。あまり綺麗でない
(defun tuareg-run-ocaml ()
  "Run an OCaml toplevel process.  I/O via buffer `*ocaml-toplevel*'."
  (interactive)
  (tuareg-run-process-if-needed "ocaml")
  (display-buffer tuareg-interactive-buffer-name))
