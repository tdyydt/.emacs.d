;; cask
;; Emacs Lisp files have been installed to:
;;  /usr/local/share/emacs/site-lisp/cask
;; load-path に入っているので場所指定は不要
(require 'cask)
(cask-initialize)

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
