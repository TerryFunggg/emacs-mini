(use-package web-mode)

(use-package emmet-mode
  :hook (web-mode tsx-ts-mode)
  :config
  (add-hook 'emmet-mode-hook (lambda ()
                               (setq emmet-indent-after-insert t))))

(use-package php-mode
  :mode "\\.php\\'"
)

;; Typescript, tsx
;; NOTE: Emacs 29 support tree-sitter, 'M-x treesit-install-language-grammer'
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . tsx-ts-mode))



;; === Lang server config ===
(use-package eglot)
(add-hook 'web-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)
(add-hook 'php-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '(php-mode . ("intelephense" "--stdio")))
(add-to-list 'eglot-server-programs '(web-mode . ("vscode-html-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(tsx-ts-mode . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))


(use-package polymode)

(define-hostmode poly-web-hostmode :mode 'web-mode)
(define-innermode poly-web-php-innermode
  :mode 'php-mode
  :head-matcher "<\\?php"
  :tail-matcher "\\?>"
  :head-mode 'host
  :tail-mode 'host)

(define-polymode poly-web-php-mode
  :hostmode 'poly-web-hostmode
  :innermodes '(poly-web-php-innermode)
)
;;(add-to-list 'auto-mode-alist '("\\.php?" . poly-web-php-mode))


(provide 'my-langs)
