(use-package company
  :config
  (global-company-mode)
  (setq company-dabbrev-downcase nil)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1))


;;(global-set-key (kbd "C-c h") 'eldoc)


(provide 'my-company)
