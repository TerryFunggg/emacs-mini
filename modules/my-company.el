(use-package company
  :config
  (global-company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))


(provide 'my-company)