(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

(add-hook 'web-mode-hook 'lsp)
(add-hook 'js-mode-hook 'lsp)
(add-hook 'php-mode-hook 'lsp)
(add-hook 'ruby-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'go-mode-hook 'lsp)

(use-package company
  :after lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :config

  (setq company-dabbrev-downcase nil)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1))

(add-hook 'company-mode-hook '(lambda ()
                                (setq company-backends
                                      (delete 'company-bbdb
                                              (delete 'company-oddmuse company-backends)))))

(global-company-mode)

;;(global-set-key (kbd "C-c h") 'eldoc)

(provide 'my-lsp)
