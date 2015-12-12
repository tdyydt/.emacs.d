;; org-mode
;; REF: http://lioon.net/org-mode-view-style
;(setq org-startup-folded
(setq org-startup-with-inline-images t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-capture

;; REF:
;; http://d.hatena.ne.jp/rubikitch/20090121/1232468026
;; (org-remember という古いバージョンのものについての記事)
;; http://d.hatena.ne.jp/rubikitch/20100819/org (上記についてのより新しい記事)
;; [[http://blog.wameiz.com/blog/2014/11/27/emacs-start-org/]
;; [howmをやめてOrg-modeでメモを取ることにした]]

(require 'org-install)
(setq org-startup-truncated nil)
(setq org-return-follows-link t)

;(org-remember-insinuate)
(setq org-directory "~/.emacs.d/org-memo/")
;; org-modeのデフォルトの書き込み先
(setq org-default-notes-file (concat org-directory "agenda.org"))

(setq org-capture-templates
      '(("t" "TODO" entry
         (file+headline nil "Inbox")
         "** TODO %?\n   %i\n   %a\n   %t")
        ("m" "Memo" entry
         (file+headline nil "Inbox")
         "** TODO %?   :memo:\n   %i\n   %a\n   %t")
        ("b" "Bug" entry
         (file+headline nil "Inbox")
         "** TODO %?   :bug:\n   %i\n   %a\n   %t")
        ("i" "Idea" entry
         (file+headline nil "Ideas")
         "** %?\n   %i\n   %a\n   %t")))
(global-set-key (kbd "C-c c") 'org-capture)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Code Reading
;; M-x org-caputure-code-reading とするか、キーバインド割り当てるかして、使えばいい。
(defvar org-code-reading-software-name nil)
;; ~/.emacs.d/org-memo/code-reading.org に記録する
(defvar org-code-reading-file "code-reading.org")
(defun org-code-reading-read-software-name ()
  (set (make-local-variable 'org-code-reading-software-name)
       (read-string "Code Reading Software: "
                    (or org-code-reading-software-name
                        (file-name-nondirectory
                         (buffer-file-name))))))

(defun org-code-reading-get-prefix (lang)
  (concat "[" lang "]"
          "[" (org-code-reading-read-software-name) "]"))
;; (defun org-capture-code-reading ()
;;   (interactive)
;;   (let* ((prefix (org-code-reading-get-prefix (substring (symbol-name major-mode) 0 -5)))
;;          (org-capture-templates
;;           `(("CodeReading" ?r "** %(identity prefix)%?\n   \n   %a\n   %t"
;;              ,org-code-reading-file "Memo"))))
;;     (org-capture)))
(defun org-capture-code-reading ()
  (interactive)
  (let* ((prefix (org-code-reading-get-prefix (substring (symbol-name major-mode) 0 -5)))
         (org-capture-templates
          '(("c" "Code Reading" entry
             (file+headline (concat org-directory org-code-reading-file)
                            "Memo")
             "** %(identity prefix) %?\n   %a\n   %T")
            )))
    ;; この関数で、org-capture を呼んで、今作ったカスタムのテンプレートで capture まで呼び出す感じと思う
    (org-capture nil "c")))

;; %? カーソル位置
;; file+headline というのはリストになっていて、
;; 保存先ファイルと (nil ならデフォルトになる？) (コードリーディングのやつは別ファイルになっている)
;; ファイルの中のどの部分 (* 要素名) に保存するかを指定する。
