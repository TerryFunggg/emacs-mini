(use-package web-mode
  :config
  (setq web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-heredoc-fontification t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode)))

(add-hook 'web-mode-hook 'lsp)

(use-package emmet-mode
  :hook (web-mode tsx-ts-mode)
  :config
  (add-hook 'emmet-mode-hook (lambda ()
                               (setq emmet-indent-after-insert t))))
(add-hook 'web-mode-hook 'emmet-mode)

(use-package php-mode
  :mode "\\.php\\'")
(add-hook 'php-mode-hook 'lsp)


;; ruby
(setq highlight-indent-guides-method 'column)
(use-package ruby-mode)
(use-package inf-ruby)
(add-hook 'ruby-ts-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-ts-mode-hook 'highlight-indent-guides-mode)
(add-hook 'ruby-mode-hook 'lsp)

;; python
(use-package highlight-indent-guides)
;;dd-hook 'python-mode-hook 'highlight-indent-guides-mode)
(add-hook 'python-ts-mode-hook 'highlight-indent-guides-mode)
(add-hook 'python-mode-hook 'lsp)

;; golang
(use-package go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'lsp)

;; C lang
(setq c-default-style "linux"
      c-basic-offset 4)

;; js mode
(setq js-indent-level 2)
(add-hook 'js-mode-hook 'lsp)



;; === Lang server config ===
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-headerline-breadcrumb-enable nil)
  )

;; (use-package eglot)
;; (add-hook 'web-mode-hook 'eglot-ensure)
;; (add-hook 'js-mode-hook 'eglot-ensure)
;; (add-hook 'php-mode-hook 'eglot-ensure)
;; (add-hook 'python-mode-hook 'eglot-ensure)
;; (add-hook 'go-mode-hook 'eglot-ensure)


;; (add-to-list 'eglot-server-programs '(php-mode . ("intelephense" "--stdio")))
;; (add-to-list 'eglot-server-programs '(web-mode . ("vscode-html-language-server" "--stdio")))
;; (add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))
;; (add-to-list 'eglot-server-programs '(tsx-ts-mode . ("typescript-language-server" "--stdio")))
;; (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp")))
;; (add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
;; (add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
;; (add-to-list 'eglot-server-programs '(java-mode . ("jdtls")))
;;(add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))


;; (use-package polymode)

;; (define-hostmode poly-web-hostmode :mode 'web-mode)
;; (define-innermode poly-web-php-innermode
;;   :mode 'php-mode
;;   :head-matcher "<\\?php"
;;   :tail-matcher "\\?>"
;;   :head-mode 'host
;;   :tail-mode 'host)

;; (define-polymode poly-web-php-mode
;;   :hostmode 'poly-web-hostmode
;;   :innermodes '(poly-web-php-innermode)
;; )
;;(add-to-list 'auto-mode-alist '("\\.php?" . poly-web-php-mode))


(provide 'my-langs)
