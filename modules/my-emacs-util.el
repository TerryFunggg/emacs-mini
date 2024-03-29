;; custom emacs build-in provided tools

(electric-pair-mode)

;; recentf
(recentf-mode 1)
(add-to-list 'recentf-exclude "\\private\\'" "\\opt\\'")

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


;; (global-set-key "\M-x"
;;                 (lambda ()
;;                   (interactive)
;;                   (call-interactively
;;                    (intern
;;                     (ido-completing-read
;;                      "M-x "
;;                      (all-completions "" obarray 'commandp))))))

;; ici



;; Tramp mode
(setq tramp-default-method "ssh")

;; hi look
(global-hi-lock-mode 1)
(add-hook 'prog-mode-hook
          (lambda ()
            (hi-lock-face-phrase-buffer "todo")))

;;treesit
(setq treesit-language-source-alist
      '(
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (java "https://github.com/tree-sitter/tree-sitter-java")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
        (php "https://github.com/tree-sitter/tree-sitter-php")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
;;https://www.masteringemacs.org/article/how-to-get-started-tree-sitter
;;C-x c-e to install treesit sources
;;(mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

;; == Mode Remap
(setq major-mode-remap-alist
      '(
        (python-mode . python-ts-mode)
        (js-mode . js-ts-mode)
        (ruby-mode . ruby-ts-mode)
        (java-mode . java-ts-mode)
        ))

;; ctags config
(setq path-to-ctags "/opt/homebrew/bin/ctags") ;; MacOS

(defun create-tags (dir-name)
  "Create tags file"
  (interactive "Directory:")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
)

(provide 'my-emacs-util)
