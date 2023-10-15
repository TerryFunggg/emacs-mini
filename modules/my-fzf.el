(use-package fzf
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        ;;fzf/position-bottom t
        fzf/window-height 25)
)

;;(global-set-key (kbd "C-c f") 'fzf-find-file)
;;(global-set-key (kbd "C-c r") 'fzf-recentf)
;;(global-set-key (kbd "C-c p") 'fzf-projectile)
;;(global-set-key (kbd "C-c g") 'fzf-git-files)
;;(global-set-key (kbd "C-x b") 'fzf-switch-buffer)


(provide 'my-fzf)
