(use-package magit)

(use-package docker
  :ensure t)

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

(defun my/fzf-find-file ()
  ""
  (interactive)
  (condition-case err
      (funcall 'fzf-git)
    (error
     (funcall 'fzf-find-file-in-dir))))
(global-set-key (kbd "C-c f") 'my/fzf-find-file)

(use-package wgrep) ;; make grep buffer editable

(provide 'my-utils)
