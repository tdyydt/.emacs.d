;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; configure load-path
;; EMACS 25 に移行する時に必要か？
;; load-path (path.el から移行)
;; (defun add-to-load-path (&rest paths)
;;   "recursively, add specified directory to load-path"
;;   (let (path)
;;     (dolist (path paths paths)
;;       (let ((default-directory
;; 	      (expand-file-name (concat user-emacs-directory path))))
;; 	(add-to-list 'load-path default-directory)
;; 	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;; 	    (normal-top-level-add-subdirs-to-load-path))))))
;; (add-to-load-path "elisp")
;; ;; cask
;; ;; emacs 25 にすると cask が load-path に入らないので
;; (add-to-load-path (concat ".cask/" emacs-version))

;; Emacs Lisp files have been installed to:
;;  /usr/local/share/emacs/site-lisp/cask
;; load-path に入っているので、場所指定は不要
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;; init-loader
;; Cask で導入している
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(wc-modeline-format "[%tlL/%tcC]"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "gray20"))))
 '(hl-line ((t (:background "gray20")))))
