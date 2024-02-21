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

;; ruby
(setq highlight-indent-guides-method 'column)
(use-package ruby-mode)
(use-package inf-ruby)
(add-hook 'ruby-ts-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-ts-mode-hook 'highlight-indent-guides-mode)

;; python
(use-package highlight-indent-guides)
;;dd-hook 'python-mode-hook 'highlight-indent-guides-mode)
(add-hook 'python-ts-mode-hook 'highlight-indent-guides-mode)

;; C lang
(setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
              c-indent-level 4         ; A TAB is equivilent to four spaces
              c-argdecl-indent 0       ; Do not indent argument decl's extra
              c-tab-always-indent t
              backward-delete-function nil) ; DO NOT expand tabs when deleting
(c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4
(defun my-c-mode-hook ()
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

;; golang
(use-package go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

;; === Lang server config ===
(use-package eglot)
(add-hook 'web-mode-hook 'eglot-ensure)
(add-hook 'js-mode-hook 'eglot-ensure)
(add-hook 'tsx-ts-mode-hook 'eglot-ensure)
(add-hook 'php-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)


(add-to-list 'eglot-server-programs '(php-mode . ("intelephense" "--stdio")))
(add-to-list 'eglot-server-programs '(web-mode . ("vscode-html-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(js-mode . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(tsx-ts-mode . ("typescript-language-server" "--stdio")))
(add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp")))
(add-to-list 'eglot-server-programs '(c-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(c++-mode . ("clangd")))
(add-to-list 'eglot-server-programs '(java-mode . ("jdtls")))
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
