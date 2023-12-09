;; perfer command for rectangles
(global-unset-key (kbd "C-x n")) ;; unbind narrowing
;; remap mail
(global-unset-key (kbd "C-x m"))
(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "C-x w")) ;; highlight duplicate with M-x h
(global-unset-key (kbd "C-x C-n")) ;; disable global column

(global-unset-key (kbd "C-x C-j")) ;; duplicate with C-x C-d with C-x C-f
(global-unset-key (kbd "C-x C-o")) ;; is for delete-blank-line
(global-set-key (kbd "C-x C-j") 'delete-blank-lines) ;;is good to use j - join for me remember the key

;; buffer
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

;;ido
;;(global-set-key (kbd "C-x C-f") 'ido-find-file)

;; imenu
(global-set-key (kbd "C-c i") 'imenu)


;; C-c
(global-set-key (kbd "C-c r") 'recentf-open-files)
(global-set-key (kbd "C-c s") 'grep-find)
(global-set-key (kbd "C-c f") 'my/fzf-find-file)
(global-set-key (kbd "C-c d") 'xref-find-definitions)
(global-set-key (kbd "C-c .") 'avy-goto-char-timer)

(provide 'my-keys)
