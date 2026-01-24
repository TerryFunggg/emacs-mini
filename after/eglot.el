(require 'eglot)
;; Performance & UI tweaks (nano-friendly)
(setq eglot-autoshutdown               t     ; kill server when buffer closes
      eglot-send-changes-idle-time     0.3   ; fast sync
      ;; eglot-ignored-server-capabilities '(:documentHighlightProvider
      ;;                                      :foldingRangeProvider
      ;;                                      :inlayHintProvider)  
      eglot-events-buffer-size         200000   ; bigger log if debugging
      eglot-auto-display-help-for-help-section nil
      )

(setq eglot-inlay-hints-mode t)

(defun my/eglot-capf ()
  "Eglot + Cape super completion."
  (setq-local completion-at-point-functions
              (list (cape-capf-buster
                     (cape-capf-super
                      #'eglot-completion-at-point
                      #'cape-dabbrev
                      #'cape-keyword
                      #'cape-file)))))

(add-hook 'eglot-managed-mode-hook #'my/eglot-capf)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "M-.")     #'xref-find-definitions)
  (define-key eglot-mode-map (kbd "M-,")     #'xref-go-back)
  (define-key eglot-mode-map (kbd "M-/")     #'xref-find-references)
  (define-key eglot-mode-map (kbd "C-c h")     #'eldoc-doc-buffer)
)

;; (add-hook 'prog-mode-hook #'eglot-ensure)



(setq eglot-server-programs
      '((python-base-mode . ("pyright-langserver" "--stdio"))
        (go-mode          . ("gopls"))
        ((js-mode js-ts-mode typescript-ts-mode) . ("typescript-language-server" "--stdio"))
        (c-mode c++-mode  . ("clangd"))))
