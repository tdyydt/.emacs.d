;; redo+
(when (require 'redo+ nil t)
  ;; "C-." = redo
  (global-set-key (kbd "C-.") 'redo))

;; undohist (http://cx4a.org/pub/undohist.el)
;; undohist.el は http://d.hatena.ne.jp/Lian/20120420/1334856445 に従ってwindows向けに修正済
(when (require 'undohist nil t)
  (undohist-initialize))

;; undo-tree
;; "M-x package-install RET undo-tree RET" すると， (p.138)
;; ~/.emacs.d/elpa/undo-tree-20140509.522 にインストールされた。
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; point-undo (p.140)
(when (require 'point-undo nil t)
  (define-key global-map [f5] 'point-undo)
  (define-key global-map [f6] 'point-redo))
