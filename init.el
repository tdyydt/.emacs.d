;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; packege.el
;; Emacs 24
(require 'package)
;; default?
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;; t ==> add ELEMENT at the end
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-initialize)

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

;; via: https://stackoverflow.com/questions/31079204/emacs-package-install-script-in-init-file
; install the missing packages
(dolist (package my-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;; This is the end of my setting part.
;; Following configs may be the configs added by other programs.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-face-groups (quote default-faces))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages (quote (company-coq async shut-up company)))
 '(wc-modeline-format "[%tlL/%tcC]"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "gray20"))))
 '(hl-line ((t (:background "gray20")))))
