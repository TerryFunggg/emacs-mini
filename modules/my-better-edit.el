(global-hl-line-mode t)
(delete-selection-mode t)
(setq shift-select-mode nil)


;; cust electric mode
(electric-indent-mode t)
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\' . ?\')
        (?\{ . ?\})))

(provide 'my-better-edit)
