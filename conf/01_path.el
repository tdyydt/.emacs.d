;; exec-path-from-shell
;; emacs の PATH を shell のと共有する
(exec-path-from-shell-initialize)

;; load-path
(defun add-to-load-path (&rest paths)
  "recursively, add specified directory to load-path"
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp")

;;(add-to-list 'load-path "~/.emacs.d/elisp/copl-mode" t)
