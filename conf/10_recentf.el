;; Time-stamp: <2016-07-24 17:17:11>
;; recentf & recentf-ext.el

(require 'recentf)
(setq recentf-save-file "~/.emacs.d/.recentf")

;; A nil value means to save the whole list.
(setq recentf-max-saved-items nil)

;; set up recentf exclusion
;; .recentf, backup files, files for editing commit message
;; REF: https://www.gnu.org/software/emacs/manual/html_node/elisp/File-Name-Expansion.html
(let ((emacs-home (expand-file-name "~/\.emacs\.d/")))
  (setq recentf-exclude
        (list (concat emacs-home "\.recentf")
              (concat emacs-home "backups/.*")
              ".*/\.git/COMMIT_EDITMSG")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tuning
;; avoid annoying messages
;; using "shut-up.el" in order to shut up recentf messages
(require 'shut-up)

;; 2015/12/11
;; 現状、*Messages* で煩いこともないし、ミニバッファに出ることもない。
;; 多分正常に機能してくれてるとは思う。解決？？？
;; REF: https://github.com/takaxp/emacs.d/blob/master/init.el
;; REF: http://pastelwill.jp/wiki/doku.php?id=emacs:init.el
;; REF: http://qiita.com/itiut@github/items/d917eafd6ab255629346
(defun silent-recentf-cleanup ()
  (interactive)
  (let ((message-log-max nil))
        (shut-up (recentf-cleanup)))
  (message ""))
(defun silent-recentf-save-list ()
  (interactive)
  (let ((message-log-max nil))
    (shut-up (recentf-save-list)))
  (message ""))

(setq recentf-auto-cleanup 'never)
;; clean up in every 90 secs
;; remove files which no longer exists
;; 真偽値は repeat の有無を示す．
(run-with-idle-timer 30 t 'silent-recentf-cleanup)
;; save .recentf every 30 secs (when idle)
(run-with-idle-timer 30 t 'silent-recentf-save-list)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This should be written after (require 'recentf)
;; OR ".recentf" file will be initialized.
(require 'recentf-ext)
