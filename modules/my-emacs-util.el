;; custom emacs build-in provided tools

(electric-pair-mode)

;; recentf
(recentf-mode 1)
(add-to-list 'recentf-exclude "\\private\\'" "\\opt\\'")
(global-set-key (kbd "C-c r") 'recentf-open-files)

;;icomplete
(icomplete-mode 1)

;; tab bar
(tab-bar-mode 1)

;; buffer
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)

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

(global-set-key (kbd "C-x C-f") 'ido-find-file)
;; (global-set-key "\M-x"
;;                 (lambda ()
;;                   (interactive)
;;                   (call-interactively
;;                    (intern
;;                     (ido-completing-read
;;                      "M-x "
;;                      (all-completions "" obarray 'commandp))))))



;; imenu
(global-set-key (kbd "C-c i") 'imenu)


;; Tramp mode
(setq tramp-default-method "ssh")

;; grep
(global-set-key (kbd "C-c s") 'grep-find)

;;treesit
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
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

(provide 'my-emacs-util)
