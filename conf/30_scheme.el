;; jakld (=Scheme処理系)
(cond ((eq system-type 'windows-nt)
       (setq scheme-program-name "~/GoogleDrive/KU/AlgDS/jakld/run-jakld.bat"))
      ((eq system-type 'darwin)
       (setq scheme-program-name "~/Dropbox/KU/15A/ProgrammingLanguages/jakld/run-jakld.sh")))

;; hook for scheme
;; inferior-scheme = run-scheme で起動するバッファ
; (add-hook 'inferior-scheme-mode-hook 'auto-complete-mode)
