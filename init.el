;; cask
;; Emacs Lisp files have been installed to:
;;  /usr/local/share/emacs/site-lisp/cask
;; load-path に入っているので場所指定は不要
(require 'cask)
(cask-initialize)

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "a802c77b818597cc90e10d56e5b66945c57776f036482a033866f5f506257bca" default)))
 '(wc-modeline-format "[%tlL/%tcC]"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "gray-15"))))
 '(hl-line ((t (:background "gray-15")))))
