(use-package eglot
  :init
  (setq eldoc-echo-area-prefer-doc-buffer t
        eldoc-echo-area-use-multiline-p nil
        eglot-autoshutdown t))

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (setq-local eglot-ignored-server-capabilities '(:documentFormatting :documentRangeFormatting))))



(add-to-list 'eglot-server-programs '(php-mode . ("intelephense" "--stdio")))
(add-to-list 'eglot-server-programs '(web-mode . ("vscode-html-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(tsx-ts-mode . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp")))
(add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(java-mode . ("jdtls")))
(add-to-list 'eglot-server-programs '(python-mode . ("pylsp")))
(add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
(add-to-list 'eglot-server-programs '(lua-mode . ("lua-language-server")))

(add-hook 'web-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'php-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'lua-mode-hook 'eglot-ensure)
(add-hook 'occur-mode-hook 'eglot-ensure)


(use-package company
  :after eglot
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
  :config

  (setq company-dabbrev-downcase nil)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1))

(add-hook 'company-mode-hook '(lambda ()
                                (setq company-backends
                                      (delete 'company-bbdb
                                              (delete 'company-oddmuse company-backends)))))

(global-company-mode)


(provide 'my-eglot)
