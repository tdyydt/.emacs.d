;; Mode Line

;; ファイルサイズ表示
(size-indication-mode t)
;; 列番号表示
(column-number-mode t)
;; バッテリー残量表示
;; (display-battery-mode t)

;; 時計
;; 最後のスペースは，調整のため。
(setq display-time-string-forms
      ;; '((format "%s %s/%s %s:%s "
      ;;          dayname month day 24-hours minutes))
      '((format "[%s:%s %s/%s %s] "
                24-hours minutes
                month day dayname))
      )
(display-time-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; major, minor mode 表示名を変更する
;; REF: http://syohex.hatenablog.com/entry/20130131/1359646452

(require 'cl)
(defvar mode-line-cleaner-alist
  '(;; For minor-mode, first char is 'space'
    (undo-tree-mode . " UT")
    (company-mode . " com")
    (company-coq-mode . " com-coq")

    ;; Major modes
    ;;(python-mode . "py")
    ;;(ruby-mode   . "rb")
    ;;(emacs-lisp-mode . "el")
    ;;(markdown-mode . "md")
    ))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; powerline
;; REF: http://emacs.stackexchange.com/questions/281/how-do-i-get-a-fancier-mode-line-that-uses-solid-colors-and-triangles
;; REF: http://blog.shibayu36.org/entry/2014/04/01/094543
;; REF: http://blog.shibayu36.org/entry/2014/02/02/192924

;; なくても良さげ
;; (require 'smart-mode-line)

;; powerline には
;; いくつか変種があるとのこと
;; REF: https://www.emacswiki.org/emacs/PowerLine

;; setup powerline
(require 'powerline)

;; powerline-themes に定義されている
(powerline-default-theme)
;(powerline-center-theme)

;; set separator:
;; nil, bar, curve, ...
;; あまり綺麗に表示されない
;; REF: http://ytsk.hatenablog.com/entry/2015/09/23/021856
(setq powerline-default-separator 'curve)
;; ファイルのどの位置にいるかの、示すバーを表示するか
;;(setq powerline-display-hud t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 色はコレを参考に
;; REF: http://blog.shibayu36.org/entry/2014/02/11/160945
;; color name list
;; REF: http://raebear.net/comp/emacscolors.html

;; for active window:
(progn
  (set-face-attribute 'mode-line nil
                      :foreground "Brack"
                      :background "violet"
                      :box nil)
  ;; major-mode, minor-mode のところ
  (set-face-attribute 'powerline-active1 nil
                      :foreground "Brack"
                      :background "White"
                      :inherit 'mode-line)
  ;; 時計とかのところ
  (set-face-attribute 'powerline-active2 nil
                      :foreground "Brack"
                      ;; :background "chocolate"
                      :background "DarkOrange"
                      :inherit 'mode-line))

;; for inactive windows:
(let ((bg-color "gray20")
      (fg-color "White"))
  (set-face-attribute 'mode-line-inactive nil
                      :foreground fg-color
                      :background bg-color
                      :box nil)
  (set-face-attribute 'powerline-inactive1 nil
                      :foreground fg-color
                      :background bg-color
                      :inherit 'mode-line)
  (set-face-attribute 'powerline-inactive2 nil
                      :foreground fg-color
                      :background bg-color
                      :inherit 'mode-line))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customize my own powerline-theme
;; based on powerline-default-theme (@ powerline-theme.el)
;; (defun powerline-my-own-theme ()
;;   "Setup the my own mode-line."
;;   (interactive)
;;   (setq-default
;;    mode-line-format
;;    '("%e"
;;      (:eval
;;       (let* ((active (powerline-selected-window-active))
;;              (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
;;              (mode-line (if active 'mode-line 'mode-line-inactive))
;;              (face1 (if active 'powerline-active1 'powerline-inactive1))
;;              (face2 (if active 'powerline-active2 'powerline-inactive2))
;;              (separator-left (intern (format "powerline-%s-%s"
;;                                              (powerline-current-separator)
;;                                              (car powerline-default-separator-dir))))
;;              (separator-right (intern (format "powerline-%s-%s"
;;                                               (powerline-current-separator)
;;                                               (cdr powerline-default-separator-dir))))
;;              (lhs (list (powerline-raw "%*" mode-line 'l)
;;                         (when powerline-display-buffer-size
;;                           (powerline-buffer-size mode-line 'l))
;;                         (when powerline-display-mule-info
;;                           (powerline-raw mode-line-mule-info mode-line 'l))
;;                         (powerline-buffer-id mode-line-buffer-id 'l)
;;                         (when (and (boundp 'which-func-mode) which-func-mode)
;;                           (powerline-raw which-func-format nil 'l))
;;                         (powerline-raw " ")
;;                         (funcall separator-left mode-line face1)
;;                         (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
;;                           (powerline-raw erc-modified-channels-object face1 'l))
;;                         (powerline-major-mode face1 'l)
;;                         (powerline-process face1)
;;                         (powerline-minor-modes face1 'l)
;;                         (powerline-narrow face1 'l)
;;                         (powerline-raw " " face1)
;;                         (funcall separator-left face1 face2)
;;                         (powerline-vc face2 'r)
;;                         (when (bound-and-true-p nyan-mode)
;;                           (powerline-raw (list (nyan-create)) face2 'l))))
;;              (rhs (list (powerline-raw global-mode-string face2 'r)
;;                         (funcall separator-right face2 face1)
;;                         (unless window-system
;;                           (powerline-raw (char-to-string #xe0a1) face1 'l))
;;                         (powerline-raw "%4l" face1 'l)
;;                         (powerline-raw ":" face1 'l)
;;                         (powerline-raw "%3c" face1 'r)
;;                         (funcall separator-right face1 mode-line)
;;                         (powerline-raw " ")
;;                         (powerline-raw "%6p" mode-line 'r)
;;                         (when powerline-display-hud
;;                           (powerline-hud face2 face1)))))
;;         (concat (powerline-render lhs)
;;                 (powerline-fill face2 (powerline-width rhs))
;;                 (powerline-render rhs)))))))
;;(powerline-my-own-theme)
