;; 起動時フレーム設定
;; default-frame もあるが、initial だけ変えておけば
;; 私の用途では問題なし

;; フレームを増やすことはあまりないが、
;; default だけ設定すると、良いようなのだが、フレームを増やした時に、
;; そちらのフレームではスクロールバーが出たりする。
(when (or (eq window-system 'ns)
          (eq window-system 'mac))
  (setq initial-frame-alist
        '((top . 1)
          (left . 1)
          (width . 160)
          (height . 40))))

;; TODO: 起動時フレームサイズ
;; 画面いっぱいだったり、フルスクリーンだったり

;; REF: http://d.hatena.ne.jp/kazu-yamamoto/20140625/1403674172

;; 最近は、フルスクリーンなので関係ないが、透過度まわり
;; こちらの設定だと現在のフレームで効くので、便利。
;;(set-frame-parameter nil 'alpha 88)
;; 透過度を変える関数を定義
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha alpha-num))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customize frame title

;; %f = ファイル名，フルパス (buffer-file-name の値)
;; %b = バッファ名 (buffer-name の値)

(setq frame-title-format "%b")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; face
;; theme も使わずに、デフォルトで。
;; 白地で無くて、黒地に変えるだけ。
;; シンプルな設定で行こう。
(when window-system (invert-face 'default))
