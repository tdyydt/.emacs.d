(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-directory "~/.emacs.d/templates/")

;; default のものを上書きしてしまう
(setq auto-insert-alist
      '(("\\.cpp" . "template.cpp")
        ("\\.tex" . "template.tex")
        ("\\.py" . "template.py")))

      ;; (append '(("\\.cpp" . "template.cpp")
      ;;           ("\\.tex" . "template.tex")
      ;;           ("\\.py" . "template.py")
      ;;           ; el はデフォルトで自動挿入のがあるが、それを無効に
      ;;           ("\\.el" . nil))
      ;;         auto-insert-alist))
