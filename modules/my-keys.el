(global-unset-key (kbd "C-x n")) ;; unbind narrowing
;; remap mail
(global-unset-key (kbd "C-x m"))
(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "C-x w")) ;; highlight duplicate with M-s h
(global-unset-key (kbd "C-x C-n")) ;; disable global column
(global-unset-key (kbd "C-x C-j")) ;; duplicate with C-x C-d with C-x C-f
(global-unset-key (kbd "C-x C-o")) ;; is for delete-blank-line
(global-unset-key (kbd "C-x C-d")) ;; disable List directory
(global-unset-key (kbd "C-x d")) ;; disable Dired key, duplicate with C-x C-f

(global-set-key (kbd "C-x C-j") 'delete-blank-lines) ;;is good to use j - join for me remember the key
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; C-c
(global-set-key (kbd "C-c r") 'recentf-open-files)
(global-set-key (kbd "C-c s") 'grep-find)
(global-set-key (kbd "C-c d") 'xref-find-definitions)
(global-set-key (kbd "C-c y") 'yank-pop)

(global-set-key (kbd "C-<f12>") 'my-func/emacs-config)
(global-set-key (kbd "C-<f11>") 'my-func/modules-config)
(global-set-key (kbd "C-x 5 M-o") 'my/move-current-buffer-to-other-frame)


;; Meta
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

(provide 'my-keys)
