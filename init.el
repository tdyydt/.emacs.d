;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; el-get
;; via: https://github.com/dimitri/el-get
;; el-get の位置を指定
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;; require it
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; init-loader
;; Cask で導入している
(el-get-bundle init-loader)
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;; This is the end of my setting part.
;; Following config may be added by other programs.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(package-selected-packages
   (quote
    (yaml-mode web-mode wc-mode visual-regexp-steroids use-package undohist undo-tree tuareg swift-mode smex smartparens smart-mode-line-powerline-theme redo+ recentf-ext python-mode projectile prodigy popwin point-undo pallet nyan-mode multiple-cursors migemo markdown-mode magit init-loader idle-highlight-mode htmlize hl-line+ helm-descbinds haskell-mode graphviz-dot-mode geiser flycheck-cask expand-region exec-path-from-shell drag-stuff ddskk company-coq col-highlight)))
 '(wc-modeline-format "[%tlL/%tcC]"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "gray20"))))
 '(hl-line ((t (:background "gray20")))))
