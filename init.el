;; packege.el
;; (>= emacs-major-version 24)
(require 'package)

;; default?
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;; t ==> add ELEMENT at the end
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-initialize)

;; Automatically update the list of packages, only if there is no package list already
;; via: https://stackoverflow.com/questions/14836958/updating-packages-in-emacs
(when (not package-archive-contents)
  (package-refresh-contents))

;;;;;;

;; Suggestion: require package
;; via: https://qiita.com/regashia/items/057b682dd29fbbdadd52
(defun package-install-if-needed (package)
  "Install given PACKAGE, if it was not installed yet."
  (unless (package-installed-p package)
    (package-install package)))

;; Other packages than init-loader
;; are installed by loading conf/00_package.el

;; init-loader
(package-install-if-needed 'init-loader)
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;; custom-set-variables are written to custom-file
;; via: http://extra-vision.blogspot.com/2016/10/emacs25-package-selected-packages.html
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; ** END **
