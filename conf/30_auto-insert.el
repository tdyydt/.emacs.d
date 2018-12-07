(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/templates/")

;; overwrite the default setting:
(setq auto-insert-alist
      '(("\\.cpp" . "template.cpp")
        ("\\.tex" . "template.tex")
        ("\\.py" . "template.py")))

;; 例えば el はデフォルトが設定されていたりする
