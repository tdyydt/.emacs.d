;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; EMACS 25 に移行する時に必要か？
;; ;; load-path (path.el から移行)
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
 '(col-highlight ((t (:background "gray20"))))
 '(hl-line ((t (:background "gray20")))))
