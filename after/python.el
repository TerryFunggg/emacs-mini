;; =============================================================================
;; Python (treesit + eglot + company)
;; =============================================================================

;; treesit python mode when available
;;(add-to-list 'major-mode-remap-alist '(python-ts-mode . python-mode))


(add-hook 'python-base-mode-hook #'eglot-ensure)

(setq eglot-server-programs
      '((python-base-mode
         . ("pyright-langserver" "--stdio"))))


;; Useful Python-specific settings
(add-hook 'python-base-mode-hook
          (lambda ()
            ;; Indentation (black/ruff style)
            (setq-local tab-width              4)
            (setq-local python-indent-offset   4)
            (setq-local fill-column            88)   ; black default line length

            ;; Show virtualenv name in mode-line (very helpful)
            ;; (when (require 'python nil t)
            ;;   (python-shell-completion-native-try))
            ))

;; Handy Python keybindings
(with-eval-after-load 'python
  (define-key python-mode-map (kbd "C-c C-c") #'run-python)   ; start REPL
;;  (define-key python-mode-map (kbd "C-c C-z") #'python-shell-switch-to-shell)
;;  (define-key python-mode-map (kbd "C-c C-c") #'python-shell-send-buffer)
;;  (define-key python-mode-map (kbd "C-c C-r") #'python-shell-send-region)


;; LSP actions via eglot
;;  (define-key python-mode-map (kbd "C-c l r") #'eglot-rename)
;;  (define-key python-mode-map (kbd "C-c l a") #'eglot-code-actions)
;;  (define-key python-mode-map (kbd "C-c l f") #'eglot-format-buffer)
  )
