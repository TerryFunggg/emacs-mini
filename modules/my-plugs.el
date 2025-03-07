(package-install 'flycheck)
(global-flycheck-mode)

(package-install 'company)
(setq company-minimum-prefix-length 2
      company-idle-delay 0.1
      company-selection-wrap-around t ;; cycle selection
      company-tooltip-align-annotations t
      company-tooltip-limit 6
      company-tooltip-flip-when-above t
      company-global-modes '(not message-mode eshell-mode))
;;(global-set-key (kbd "<tab>") #'company-indent-or-complete-common)
(global-company-mode)

(provide 'my-plugs)
