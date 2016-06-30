;; -*- mode: emacs-lisp -*-
;; el-get も気になるが、とりあえず cask を試してみる
;; REF: (el-get) http://tarao.hatenablog.com/entry/20150221/1424518030

;; REF: http://cask.readthedocs.io/en/latest/guide/usage.html (official guide)
;; % cask init
;; % cask install (emacs コマンドを読んだ時の version を見てインストールがなされる。mac 標準の emacs が参照されないようにするか、EMACS="emacs24.1" とする)
;; % cask update

;; TODO:
;; .cask を load-path に追加する
;; コメントこれでいいのか？
;; git から ELPA を消す

(source gnu)
(source melpa)
(source marmalade)

;; items added by cask init
(depends-on "bind-key")
(depends-on "cask")
(depends-on "dash")
(depends-on "drag-stuff")
(depends-on "expand-region")
(depends-on "f")
(depends-on "flycheck")
(depends-on "flycheck-cask")
(depends-on "htmlize")
(depends-on "idle-highlight-mode")
(depends-on "multiple-cursors")
(depends-on "nyan-mode")
(depends-on "pallet")
(depends-on "popwin")
(depends-on "prodigy")
(depends-on "projectile")
(depends-on "s")
(depends-on "smartparens")
(depends-on "smex")
(depends-on "use-package")
(depends-on "web-mode")

;;
(depends-on "init-loader")
;; PATH
(depends-on "exec-path-from-shell")
;; helm
(depends-on "helm")
(depends-on "helm-descbinds")
;; git
(depends-on "magit")
;; completion
(depends-on "company")
;; search / replace
(depends-on "migemo")
(depends-pn "visual-regexp")
(depends-pn "visual-regexp-steroids")
;; SKK
(depends-on "ddskk")
;; recentf
(depends-on "recentf-ext")
(depends-on "shut-up")
;; undo
(depends-on "undo-tree")
(depends-on "undohist")
;(depends-on "redo+")
;(depends-on "point-undo")

;; wc
(depends-on "wc-mode")
;; snippet
(depends-on "yasnippet")

;; highlight
(depends-on "hl-line+")
(depends-on "col-highlight")

;; major modes
(depends-on "markdown-mode")
(depends-on "yaml-mode")
(depends-on "haskell-mode")
(depends-on "swift-mode")
;; Racket, Scheme
(depends-on "geiser")
;; OCaml
(depends-on "tuareg")
;; graphviz
(depends-on "graphviz-dot-mode")
