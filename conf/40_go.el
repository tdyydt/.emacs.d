(require 'go-mode)

(defun my-go-mode-hook ()
  (setq-default)
  (setq tab-width 2)
  (setq standard-indent 2)
  (setq indent-tabs-mode nil))

(add-hook 'go-mode-hook 'my-go-mode-hook)
