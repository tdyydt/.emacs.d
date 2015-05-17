;; elpa
;; package 取得元を増やす
;; init-loader を ELPA によってインストールしてるから，その設定よりも前に書かないといけない点を理解しておく
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)                    ;初期化


;; init-loader
(require 'init-loader)
;; Load configuration files in '/path/to/init-directory'.
(init-loader-load "~/.emacs.d/inits")
;; If you omit arguments, then `init-loader-directory' is used
;(init-loader-load) これを書くとエラーになるので
