(global-set-key (kbd "M-x") 'counsel-M-x)
(global-unset-key (kbd "C-x n")) ;; unbind narrowing
;; remap mail
(global-unset-key (kbd "C-x m"))
(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "C-x w")) ;; highlight duplicate with M-s h
(global-unset-key (kbd "C-x C-n")) ;; disable global column

(global-unset-key (kbd "C-x C-j")) ;; duplicate with C-x C-d with C-x C-f
(global-unset-key (kbd "C-x C-o")) ;; is for delete-blank-line
(global-set-key (kbd "C-x C-j") 'delete-blank-lines) ;;is good to use j - join for me remember the key

;;ido
(global-unset-key (kbd "C-x f"))
(global-set-key (kbd "C-x f") 'ido-find-file)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x b") 'counsel-ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; C-c
(global-set-key (kbd "C-c i") 'counsel-imenu)
(global-set-key (kbd "C-c r") 'recentf-open-files)
(global-set-key (kbd "C-c s") 'grep-find)
(global-set-key (kbd "C-c f") 'my-func/fzf-find-file)
(global-set-key (kbd "C-c d") 'xref-find-definitions)
(global-set-key (kbd "C-c b") 'list-bookmarks)
(global-set-key (kbd "C-c y") 'yas-insert-snippet)
(global-set-key (kbd "C-c t t") 'counsel-etags-find-tag-at-point)
(global-set-key (kbd "C-c t l") 'counsel-etags-list-tag)
(global-set-key (kbd "C-c w h") 'windmove-swap-states-left)
(global-set-key (kbd "C-c w k") 'windmove-swap-states-up)
(global-set-key (kbd "C-c w j") 'windmove-swap-states-down)
(global-set-key (kbd "C-c w l") 'windmove-swap-states-right)

(global-set-key (kbd "C-<f12>") 'my-func/emacs-config)
(global-set-key (kbd "C-<f11>") 'my-func/modules-config)
(global-set-key (kbd "C-x 5 M-o") 'my/move-current-buffer-to-other-frame)


;; Meta
(global-set-key (kbd "M-.") 'avy-goto-char-timer)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

(provide 'my-keys)
