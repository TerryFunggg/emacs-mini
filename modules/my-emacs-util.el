;; custom emacs build-in provided tools
(electric-pair-mode)

;; recentf
(recentf-mode 1)
(add-to-list 'recentf-exclude "\\private\\'" "\\opt\\'" "\\tmp\\'")

;;icomplete
(icomplete-mode 1)

;; tab bar
(tab-bar-mode 1)


;; dired
(require 'dired-x)
(setq dired-dwim-target t)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(define-key dired-mode-map (kbd "-") #'dired-up-directory)

;; ido
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-decorations
      '("" "" "   |   " " | ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))

;; Tramp mode
(setq tramp-default-method "ssh")

;; hi look
(global-hi-lock-mode 1)
(add-hook 'prog-mode-hook
          (lambda ()
            (hi-lock-face-phrase-buffer "todo")))

;;treesit
;; dun wanna config anymore :(
;; (setq treesit-language-source-alist
;;       '(
;;         (c "https://github.com/tree-sitter/tree-sitter-c")
;;         (java "https://github.com/tree-sitter/tree-sitter-java")
;;         (elisp "https://github.com/Wilfred/tree-sitter-elisp")
;;         (html "https://github.com/tree-sitter/tree-sitter-html")
;;         (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
;;         ;;(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
;;         (json "https://github.com/tree-sitter/tree-sitter-json")
;;         (python "https://github.com/tree-sitter/tree-sitter-python")
;;         (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
;;         (go "https://github.com/tree-sitter/tree-sitter-go")
;;         (go-mod "https://github.com/camdencheek/tree-sitter-go-mod" "main" "src")
;;         ))
;;https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
;;C-x c-e to install treesit sources
;;(mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

;; == Mode Remap
;; (setq major-mode-remap-alist
;;       '(
;;         (python-mode . python-ts-mode)
;;         (js-mode . js-ts-mode)
;;         (typescript-mode . typescript-ts-mode)
;;         (ruby-mode . ruby-ts-mode)
;;         (java-mode . java-ts-mode)
;;         (c-mode . c-ts-mode)
;;         (json-mode . json-ts-mode)
;;         (go-mode . go-ts-mode)
;;         ))

;; (require 'tree-sitter)
;; (require 'tree-sitter-langs)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;;(add-hook 'prog-mode #'tree-sitter-mode)
;;(add-hook 'emacs-lisp-mode-hook #'tree-sitter-mode)



;; ;; ctags config
;; (setq path-to-ctags "/opt/homebrew/bin/ctags") ;; MacOS

;; (defun create-tags (dir-name)
;;   "Create tags file"
;;   (interactive "Directory:")
;;   (shell-command
;;    (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
;; )

(winner-mode 1)

(provide 'my-emacs-util)
