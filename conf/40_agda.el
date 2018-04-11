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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set agda include path
;; agda コマンドの -i オプションに相当？
;; agda2-include-dirs 変数は、もう使われていない。
;; (custom-set-variables
;;  '(agda2-include-dirs

;; ソースコードに書かれた代替案2 を採用する
;; (custom-set-variables
;;  '(agda2-program-args
;;    `(,(concat "-i " (expand-file-name "~/Work/univ/agda/1.3"))
;;      ,(concat "-i " (expand-file-name "~/Work/univ/agda/gratr2/agda"))
;;      )))

;; 無理だった・諦める

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Chapter 7
;; gratr

;; gratr.el の説明に従った

;; (setq load-path (cons (expand-file-name "~/gratr/") load-path))
(add-to-list 'load-path
             (expand-file-name "~/Work/univ/agda/gratr2/"))
(add-to-list 'auto-mode-alist '("\\.gr$" . gratr-mode))
(autoload 'gratr-mode "gratr" "Highlight mode for the gratr syntax." t)
