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

;; bookmark
(global-set-key (kbd "C-c b") 'bookmark-bmenu-list)

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
(global-set-key "\M-x"
                (lambda ()
                  (interactive)
                  (call-interactively
                   (intern
                    (ido-completing-read
                     "M-x "
                     (all-completions "" obarray 'commandp))))))



;; imenu
(global-set-key (kbd "C-c i") 'imenu)


;; Tramp mode
(setq tramp-default-method "ssh")

;; grep
(global-set-key (kbd "C-c s") 'grep-find)




(provide 'my-emacs-util)
