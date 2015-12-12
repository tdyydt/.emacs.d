(setq elscreen-prefix-key (kbd "C-z"))
;(setq elscreen-prefix-key (kbd "C-t"))
(elscreen-start)

(setq elscreen-tab-display-kill-screen nil)
(setq elscreen-tab-display-control nil)

(global-set-key (kbd "C-z <left>") 'elscreen-previous)
(global-set-key (kbd "C-z <right>") 'elscreen-next)
