(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)

(setq time-stamp-active t)
;; Time-stamp:<2017-06-02 20:53:56>,
;; Last updated: <> とかを想定，と思ったけど無理か？
;(setq time-stamp-start "([Tt]ime[ -][Ss]tamp|[Ll]ast[ -][Uu]pdated?)[ \t]*:[ \t]*<")
(setq time-stamp-start "[Tt]ime[ -][Ss]tamp[ \t]*:[ \t]*<")
(setq time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S")
(setq time-stamp-end ">")
;; 8行目まで見る
(setq time-stamp-line-limit 8)


;; Reference (source: http://ochiailab.blogspot.jp/2012/11/time-stamp.html)
;;     %:a -- Monday 曜日
;;     %#A -- MONDAY 全部大文字で曜日
;;     %:b -- January 月

;;     桁数を指定すると指定した文字だけが表示される.
;;     "%2#A"なら MO など．

;;     %02H -- 15  時刻 (24 時間)
;;     %02I -- 03  時刻 (12 時間)
;;     %#p  -- pm  PM と AM の別
;;     %P   -- PM  PM と AM の別
;;     %w   -- 土曜なら 6. 日曜を 0 とし，何番目の曜日なのか
;;     %02y -- 03  西暦の下 2 桁．
;;     %z   -- jst  タイムゾーン
;;     %Z   -- JST  タイムゾーン
;;     %%   -- %自体を入力
;;     %f   -- ファイル名
;;     %F   -- ファイル名のフルパス
;;     %s   -- マシン名
;;     %u   -- ログインしたユーザ名
;;     %U   -- ログインしたユーザのフルネーム
