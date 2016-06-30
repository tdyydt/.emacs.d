;; asm mode
;; assembly
(require 'asm-mode)

;; 明示的に require しないとエラーになった
;; avoid indent in RET
(define-key asm-mode-map (kbd "C-m") 'newline)
