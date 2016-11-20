;; python mode

;; run-python (C-c C-p)
;; で起動するプログラムを "python" から変更
;; ipython とかにする手もあるのかもしれない
(setq python-shell-interpreter "python3")
;(setq python-shell-interpreter "ipython3")


;; emacs 標準の python mode とは別の
;; python-mode.el を使ってみる
;; REF: https://www.emacswiki.org/emacs/ProgrammingWithPythonModeDotEl
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Emacs 標準のものは Python と出るが
;; こちらは Py
;; Abbrev か何かのエラーが出る？

;; (defun python-mode-hooks ()
;;   ;; 'C-.' で redo したいので、解除
;;   (define-key python-mode-map (kbd "<C-backspace>") nil))
;; (add-hook 'python-mode-hook 'python-mode-hooks)

(defun python-mode-hooks ()
  ;; avoid annoying [py-indent-or-complete]
  (define-key python-mode-map (kbd "<tab>") 'indent-for-tab-command)
  )
(add-hook 'python-mode-hook 'python-mode-hooks)
