;; exec-path-from-shell
;; emacs の PATH を shell の PATH と共有する
(exec-path-from-shell-initialize)

;; load-path
(defun add-to-load-path (&rest paths)
  "recursively, add specified subdirectory to load-path"
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; subdirectories of ~/.emacs.d
(add-to-load-path "elisp")

;; opam (e.g. Ott)
(mapcar (lambda (path) (add-to-list 'load-path path))
        (file-expand-wildcards "~/.opam/*/share/emacs/site-lisp"))
