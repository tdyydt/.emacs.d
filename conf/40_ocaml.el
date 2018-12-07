;; OCaml
;; tuareg mode

;; enable tuareg-mode also in:
;; .ml, .mli, .mly, .mll, and .mlp
;; via: https://www.emacswiki.org/emacs/AutoModeAlist
(add-to-list 'auto-mode-alist
             '("\\.ml[iylp]?\\'" . tuareg-mode))

;; customize function indentation
;; via: https://github.com/ocaml/tuareg#customization
(setq tuareg-indent-align-with-first-arg nil)
