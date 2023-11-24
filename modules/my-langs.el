(use-package web-mode)
(use-package php-mode)

;; Typescript, tsx
;; NOTE: Emacs 29 support tree-sitter, 'M-x treesit-install-language-grammer'
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . tsx-ts-mode))


(provide 'my-langs)
