(use-package ivy)
(use-package counsel)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)



(ivy-mode)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "M-y") 'counsel-yank-pop)
;;(global-set-key (kbd "M-f") 'counsel-fzf)
(global-set-key (kbd "C-c b b") 'counsel-switch-buffer)
;;(global-set-key (kbd "M-m") 'counsel-bookmark)

(provide 'my-ivy)
