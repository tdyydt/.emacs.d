;; Emacs Web Wowser
;; web browser in Emacs
;; w3m というのもある

;; 実験ページとか、Safari で常に開いているのはやりにくい。
;; なので emacs で開いてはどうかと
;; テキストベースだし。

;; REF: http://futurismo.biz/archives/2950

;; REF: http://ergoemacs.org/emacs/emacs_eww_web_browser.html
(defun eww-mode-hook--rename-buffer ()
  "Rename eww browser's buffer so that sites will open in new page."
  (rename-buffer "eww" t))
(add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)

;; search engine
(setq eww-search-prefix "http://www.google.co.jp/search?q=")
;; 黒背景を利用していると, google の検索結果が白みががかってしまってつか いものにならなかった.
;; 以下の設定をしたら, あらー不思議. いろが消えた.
(defvar eww-disable-colorize t)
(defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
  (unless eww-disable-colorize
    (funcall orig start end fg)))
(advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
(advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
(defun eww-disable-color ()
  "eww で文字色を反映させない"
  (interactive)
  (setq-local eww-disable-colorize t)
  (eww-reload))
(defun eww-enable-color ()
  "eww で文字色を反映させる"
  (interactive)
  (setq-local eww-disable-colorize nil)
  (eww-reload))

;; TODO
;; helm
;; http://rubikitch.com/2014/11/26/helm-eww/
