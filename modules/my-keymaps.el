;; recentf
(global-set-key (kbd "C-c r") 'recentf-open-files)

;; ace-window
(global-set-key (kbd "C-x 0") 'ace-window)

;;avy
(global-set-key (kbd "C-c .") 'avy-goto-char-timer)


;; fzf
(global-set-key (kbd "C-c f") 'fzf-find-file)
(global-set-key (kbd "C-c r") 'fzf-recentf)
(global-set-key (kbd "C-c p") 'fzf-projectile)
(global-set-key (kbd "C-c g") 'fzf-git-files)
(global-set-key (kbd "C-x b") 'fzf-switch-buffer)

;; rg
(global-set-key (kbd "C-c s") 'rg)

;; ivy,counsel
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(provide 'my-keymaps)
