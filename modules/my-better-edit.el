(use-package crux
    :bind (("C-a" . crux-move-beginning-of-line)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package avy)
(global-set-key (kbd "C-c .") 'avy-goto-char-timer)


(provide 'my-better-edit)
