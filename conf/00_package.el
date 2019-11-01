;; NOTE: As an exception, install init-loader in init.el
(setq my-package-list
      '(exec-path-from-shell
        shut-up recentf-ext
	undo-tree undohist
        helm helm-descbinds
        magit
        migemo
        visual-regexp visual-regexp-steroids
        company
        smart-mode-line
        ;; wc-mode
        ;; hl-line+ col-highlight
        ;;;; language major modes:
        ;; graphviz haskell
	markdown-mode yaml-mode
        tuareg python-mode geiser       ; Geiser for racket
        go-mode
        rust-mode
        web-mode
        dockerfile-mode
        ))

;; package-install-if-needed ==> Defined in init.el
;; via: https://stackoverflow.com/questions/31079204/emacs-package-install-script-in-init-file
(dolist (package my-package-list)
  (package-install-if-needed package))

;; TODO: skip if error
