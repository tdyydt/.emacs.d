;; added by `agda-mode setup`
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;; conor
;;(setq agda2-highlight-face-groups 'default-faces)
;; (agda2-highlight-set-faces
;;  'default-faces 'agda2-highlight)

;(agda2-highlight-set-faces
; 'agda2-highlight 'default-faces)
 ;;'agda2-highlight 'conor)

;; hook でやる必要？？
(defun my-agda2-mode-hooks ()
  (custom-set-variables
   '(agda2-highlight-face-groups (quote default-faces))))
(add-hook 'agda2-mode-hook 'my-agda2-mode-hooks)
