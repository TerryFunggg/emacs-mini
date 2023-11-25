(use-package company
  :config
  (global-company-mode)
  (setq company-dabbrev-downcase nil)
  (setq company-backends
      '(
        (company-tabnine company-dabbrev company-keywords company-files company-capf)
        ))
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))


(provide 'my-company)
