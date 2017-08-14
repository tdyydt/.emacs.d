;; added by `agda-mode setup`
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;; agda highlight choices:
;; conor, default-faces, nil
(defun my-agda2-mode-hooks ()
  (custom-set-variables
   '(agda2-highlight-face-groups (quote default-faces))))
(add-hook 'agda2-mode-hook 'my-agda2-mode-hooks)

;; (agda2-highlight-set-faces
;;  'agda2-highlight 'default-faces)

;; customize-set-variables の setter の働きにより、上記関数の
;; 呼び出しが評価されることになるが、それには agda が読み込まれて
;; 無いといけない？
;; 故に hook に追加しないと、効き目がない。

;;;;;
;; Chapter 7
;; gratr

;; gratr.el の説明に従った

;; (setq load-path (cons (expand-file-name "~/gratr/") load-path))
(add-to-list 'load-path
             (expand-file-name "~/Work/univ/agda/gratr2/"))
(add-to-list 'auto-mode-alist '("\\.gr$" . gratr-mode))
(autoload 'gratr-mode "gratr" "Highlight mode for the gratr syntax." t)
