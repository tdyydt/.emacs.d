;; auto-install (p.113)
;; 機能例: "M-x install-elisp RET" の後に elisp の URL を指定するだけで、
;; auto-install-directory に保存 & byte-compileしてくれる。
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))
