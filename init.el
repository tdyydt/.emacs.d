;; elpa
;; package 取得元を増やす
;; init-loader を ELPA によってインストールしてるから，その設定よりも前に書かないといけない点を理解しておく
;(require 'package)
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;(package-initialize)                    ;初期化

;; cask
;; Emacs Lisp files have been installed to:
;;  /usr/local/share/emacs/site-lisp/cask
;; load-path に入っているはず
(require 'cask "cask.el")
(cask-initialize)

;; init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
