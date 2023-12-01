(use-package web-mode)

(use-package css-mode
  :mode "\\.css\\'"
  :config
  (setq css-indent-offset 2))

(use-package emmet-mode
  :hook (web-mode tsx-ts-mode)
  :config
  (add-hook 'emmet-mode-hook (lambda ()
                               (setq emmet-indent-after-insert t))))

(use-package php-mode
  ;;:mode "\\.php\\'"
)

;; Typescript, tsx
;; NOTE: Emacs 29 support tree-sitter, 'M-x treesit-install-language-grammer'
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . tsx-ts-mode))

(provide 'my-langs)
