(setq my-package-list
      '(init-loader
        exec-path-from-shell
        shut-up recentf-ext
        ;; redo+ point-undo
        ;; ==> not in package
	undo-tree undohist
        helm helm-descbinds
        magit
        migemo
        visual-regexp visual-regexp-steroids
        company
        ;; langs
        ;; graphviz?
        ;; haskell
	markdown-mode yaml-mode
        tuareg python-mode geiser       ; Geiser for racket
        smart-mode-line
        ;; wc-mode
        ;; hl-line+ col-highlight
        ))

;; package-install-if-needed ==> Defined in init.el
;; via: https://stackoverflow.com/questions/31079204/emacs-package-install-script-in-init-file
(dolist (package my-package-list)
  (package-install-if-needed package))

;; TODO: skip if error
