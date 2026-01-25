;; compay configs
(require 'company)

(setq company-idle-delay               0.1
      company-minimum-prefix-length      1
      company-tooltip-align-annotations  t
      company-tooltip-limit             12
      company-tooltip-flip-when-above    t
      company-dabbrev-ignore-case        t
)
(global-company-mode 1)

;; Popup keys
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "<tab>") #'company-complete-common))

;; Disable company in shells, terminals, REPLs, eshell, etc.
(dolist (hook '(eshell-mode-hook
                shell-mode-hook
                inferior-python-mode-hook
                log-
                log-edit-mode-hook))
  (add-hook hook (lambda () (company-mode -1))))

;; eglot configs
(require 'eglot)
(setq eglot-autoshutdown               t     ; kill server when buffer closes
      eglot-send-changes-idle-time     0.3   ; fast sync
      ;; eglot-ignored-server-capabilities '(:documentHighlightProvider
      ;;                                      :foldingRangeProvider
      ;;                                      :inlayHintProvider)  
      eglot-events-buffer-size         200000   ; bigger log if debugging
      eglot-auto-display-help-for-help-section nil
      eldoc-echo-area-prefer-doc-buffer t
      eldoc-echo-area-use-multiline-p nil
      eglot-autoshutdown t
      )

(setq eglot-inlay-hints-mode t)

(setq company-backends
      '((company-capf
         company-dabbrev
         company-dabbrev-code
         company-files
         company-keywords)))

(add-to-list 'eglot-stay-out-of 'company-backends)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "M-.")     #'xref-find-definitions)
  (define-key eglot-mode-map (kbd "M-,")     #'xref-go-back)
  (define-key eglot-mode-map (kbd "M-/")     #'xref-find-references)
  (define-key eglot-mode-map (kbd "C-c h")     #'eldoc-doc-buffer)
)
