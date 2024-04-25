(use-package company
  :after lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :config

  (setq company-dabbrev-downcase nil)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1))

(global-company-mode)

;;(global-set-key (kbd "C-c h") 'eldoc)


(provide 'my-company)
