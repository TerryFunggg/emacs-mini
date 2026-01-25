;; =============================================================================
;; Web / HTML / JS/TS
;; =============================================================================

(add-to-list 'auto-mode-alist '("\\.js\\'"   . js-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"  . js-jsx-mode))     ; React JSX/TSX
(add-to-list 'auto-mode-alist '("\\.ts\\'"   . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'"  . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'"  . web-mode))       ; Vue files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'"  . web-mode))       ; optional

(when (require 'web-mode nil t)   ; built-in in many distros, or install manually
  (setq web-mode-markup-indent-offset  2)
  (setq web-mode-css-indent-offset     2)
  (setq web-mode-code-indent-offset    2)
  (setq web-mode-enable-auto-pairing   t)
  (setq web-mode-enable-auto-closing   t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-element-highlight t)

  (setq web-mode-auto-close-style 2)   ; insert closing tag on >
  (setq web-mode-tag-auto-close-style t))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((js-mode js-jsx-mode typescript-ts-mode tsx-ts-mode web-mode)
                 . ("typescript-language-server" "--stdio"))))


(dolist (hook '(js-mode-hook
                typescript-ts-mode-hook
                tsx-ts-mode-hook
                web-mode-hook))
  (add-hook hook #'eglot-ensure))


(with-eval-after-load 'company
  (add-to-list 'company-backends
               '(company-capf company-dabbrev-code company-files company-css company-web-html)) 
)

;; 7. Optional: nicer web-mode faces (subtle)
(custom-set-faces
 '(web-mode-current-element-highlight-face ((t (:background "#2a2a2a" :extend t))))
 '(web-mode-comment-face           ((t (:slant italic :foreground "gray60")))))
