;; init.el に保存してたのだが，それだとなんか効いてない感じだったので変更

(defun add-to-load-path (&rest paths)
  "再帰的にサブディレクトリも load-path に追加"
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp" "conf")

;; exec-path-from-shell
;; emacs の PATH を shell と共有する
(exec-path-from-shell-initialize)
