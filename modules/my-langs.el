(use-package web-mode)

(use-package css-mode
  :ensure t
  :mode "\\.css\\'"
  :config
  (add-hook 'css-mode-hook (lambda()
                             (add-to-list (make-local-variable 'company-backends)
                                          '(company-css company-files company-capf))))

  (setq css-indent-offset 2)
)

(use-package emmet-mode
  :ensure t
  :hook (web-mode tsx-ts-mode)
  :config
  (add-hook 'emmet-mode-hook (lambda ()
                               (setq emmet-indent-after-insert t)))
)

(use-package php-mode)

;; Typescript, tsx
;; NOTE: Emacs 29 support tree-sitter, 'M-x treesit-install-language-grammer'
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . tsx-ts-mode))


(provide 'my-langs)
