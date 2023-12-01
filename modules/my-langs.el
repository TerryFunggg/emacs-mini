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


;; ===== lsp(eglot) language server config =====
(add-hook 'web-mode-hook 'eglot-ensure)
(add-hook 'css-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)
(add-hook 'php-mode-hook 'eglot-ensure) ;;npm i intelephense -g


(add-to-list 'eglot-server-programs '(php-mode . ("intelephense" "--stdio")))
(add-to-list 'eglot-server-programs '(web-mode . ("vscode-html-language-server" "--stdio"))
(add-to-list 'eglot-server-programs '(css-mode . ("vscode-css-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))



(provide 'my-langs)
