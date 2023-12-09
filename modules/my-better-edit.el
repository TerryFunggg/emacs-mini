(use-package crux
    :bind (("C-a" . crux-move-beginning-of-line)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package avy)



(winner-mode t)
(global-hl-line-mode t)
(delete-selection-mode t)
(setq shift-select-mode nil)


;; cust electric mode
(electric-indent-mode 0)
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\/ . ?\/)
        (?\{ . ?\})))




(provide 'my-better-edit)
