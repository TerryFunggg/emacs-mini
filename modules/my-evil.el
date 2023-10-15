(use-package evil)
(use-package evil-leader)
(use-package evil-matchit)
(use-package evil-surround)

(setq evil-want-C-u-scroll t)
(global-evil-leader-mode)
(global-evil-matchit-mode 1)
(global-evil-surround-mode 1)
(evil-mode 1)

(evil-leader/set-leader "<SPC>")
;;(evil-leader/set-key)

(provide 'my-evil)
