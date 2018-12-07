;; python mode
;; another python mode, not default one

;; run-python (C-c C-p)
;; で起動するプログラムを "python" から変更
;; ipython とかにする手もあるのかもしれない
(setq python-shell-interpreter "python3")
;(setq python-shell-interpreter "ipython3")


;; python-mode.el (emacs 標準の python mode とは別)
;; Emacs 標準は Python だが，これは Py
;; REF: https://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


(defun my-python-mode-hooks ()
  ;; avoid annoying [py-indent-or-complete]
  (define-key python-mode-map (kbd "<tab>") 'indent-for-tab-command)
  )
(add-hook 'python-mode-hook 'my-python-mode-hooks)
