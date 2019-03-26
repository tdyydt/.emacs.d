;; or js2-mode
(require 'web-mode)

;; html, js
;; http://web-mode.org

;; via: https://qiita.com/kwappa/items/6bde1fe2bbeedc85023e

(add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))

;; edit any js in jsx mode; maybe not good idea?
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)  ; e.g. js
  (setq web-mode-enable-auto-indentation nil)
)
(add-hook 'web-mode-hook 'my-web-mode-hook)
