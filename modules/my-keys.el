;; perfer command for rectangles
(global-unset-key (kbd "C-x n")) ;; unbind narrowing
;; remap mail
(global-unset-key (kbd "C-x m"))
(global-unset-key (kbd "M-c"))


(global-set-key (kbd "C-c b") 'list-bookmarks)
(global-set-key (kbd "C-c t t") 'tab-new)
(global-set-key (kbd "C-c t q") 'tab-close)
(global-set-key (kbd "C-c t p") 'tab-previous)
(global-set-key (kbd "C-c t n") 'tab-next)


(provide 'my-keys)
