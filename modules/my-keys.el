;; perfer command for rectangles
(global-unset-key (kbd "C-x n")) ;; unbind narrowing
;; remap mail
(global-unset-key (kbd "C-x m"))
(global-unset-key (kbd "M-c"))


(global-set-key (kbd "C-c b") 'list-bookmarks)


(provide 'my-keys)
