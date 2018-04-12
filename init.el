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


;; Suggestion: require package
;; via: https://qiita.com/regashia/items/057b682dd29fbbdadd52
(defun package-install-if-needed (package)
  "Install given PACKAGE, if it was not installed yet."
  (unless (package-installed-p package)
    (package-install package)))

;; init-loader
(package-install-if-needed 'init-loader)
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
