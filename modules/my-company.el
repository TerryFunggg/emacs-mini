(use-package company
  :config
  (global-company-mode)
  (setq company-dabbrev-downcase nil)

  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))




(use-package eglot)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)
(global-set-key (kbd "<f6>") 'xref-find-definitions)
(global-set-key (kbd "C-c h") 'eldoc)


(provide 'my-company)
