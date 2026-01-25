;; =============================================================================
;; C / C++ –  eglot + company
;; =============================================================================

(add-to-list 'auto-mode-alist '("\\.h\\'"   . c++-mode))   ; treat .h as C++ by default
(add-to-list 'auto-mode-alist '("\\.hh\\'"  . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))

;; 2. Eglot server for C / C++
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode)
                 . ("clangd"
                    ;; Useful flags – adjust if needed
                    "--background-index"
                    "--clang-tidy"
                    "--header-insertion=iwyu"
                    "--completion-style=detailed"
                    "--function-arg-placeholders=0"))))

;; 3. Auto-start eglot in C/C++ buffers
(dolist (hook '(c-mode-hook c++-mode-hook))
  (add-hook hook #'eglot-ensure))

;; 4. Company – prefer LSP completions
(with-eval-after-load 'company
  (add-to-list 'company-backends
               '(company-capf               ; ← eglot/clangd completions
                 company-dabbrev-code
                 company-files
                 company-keywords))
)

;; 5. C/C++ specific settings
(add-hook 'c-mode-hook
          (lambda ()
            (setq-local c-default-style "linux"     ; or "k&r", "gnu", "bsd", etc.
                        c-basic-offset       4       ; 4 spaces indent
                        tab-width            4
                        indent-tabs-mode     nil     ; use spaces
                        fill-column          100)))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq-local c-default-style "stroustrup" ; good for modern C++
                        c-basic-offset       4
                        tab-width            4
                        indent-tabs-mode     nil
                        fill-column          100)))

;; 6. Useful keybindings
(with-eval-after-load 'cc-mode
  ;; Eglot / LSP actions
  ;; (define-key c-mode-map  (kbd "C-c l r") #'eglot-rename)
  ;; (define-key c-mode-map  (kbd "C-c l a") #'eglot-code-actions)
  ;; (define-key c-mode-map  (kbd "C-c l f") #'eglot-format-buffer)
  ;; (define-key c++-mode-map (kbd "C-c l r") #'eglot-rename)
  ;; (define-key c++-mode-map (kbd "C-c l a") #'eglot-code-actions)
  ;; (define-key c++-mode-map (kbd "C-c l f") #'eglot-format-buffer)  
  )

(defun my/compile-c-project()
  "Call emacs build-in compile command"
  (interactive)
  (save-buffer)
  (let* ((project-dir (locate-dominating-file default-directory "Makefile"))
         (makefile-exists (and project-dir (file-exists-p (concat project-dir "Makefile")))))
    (if makefile-exists
        ;; if Emacs find Makefile under projects:
        (progn
          (compile (format "cd %s && make" project-dir))
          (message (format "Compiled %s" (concat project-dir "Makefile"))))
      ;; Else, no any Makefile found, let user type command
      (compile (read-string "Compile command: " "")))))
