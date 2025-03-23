(use-package vertico
  :init (vertico-mode))

(use-package ivy)
(use-package counsel)
(use-package counsel-etags)

(use-package git-gutter)
(global-git-gutter-mode +1)
(use-package magit)

;; it ok but still love using term to access
;;(use-package docker
;;  :ensure t)

;;(use-package undo-tree)
;;(global-undo-tree-mode)

(use-package fzf
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        ;;fzf/position-bottom t
        fzf/window-height 25)
  )


(use-package wgrep) ;; make grep buffer editable


(use-package yasnippet)
;;(push 'company-yasnippet company-backends)
(yas-global-mode 1)


;;(use-package aggressive-indent)
;;(add-hook 'prog-mode-hook 'aggressive-indent-mode)
;;(global-aggressive-indent-mode 1)
;;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(use-package restclient)
(use-package lorem-ipsum)

(use-package pos-tip)
 (defun my-describe-function (function)
   "Display the full documentation of FUNCTION (a symbol) in tooltip."
   (interactive (list (function-called-at-point)))
   (if (null function)
       (pos-tip-show
        "** You didn't specify a function! **" '("red"))
     (pos-tip-show
      (with-temp-buffer
        (let ((standard-output (current-buffer))
              (help-xref-following t))
          (prin1 function)
          (princ " is ")
          (describe-function-1 function)
          (buffer-string)))
      nil nil nil 0)))
(define-key emacs-lisp-mode-map (kbd "C-;") 'my-describe-function)

(use-package project-tab-groups
  :ensure
  :config
  (project-tab-groups-mode 1))

(global-set-key (kbd "C-<next>") 'tab-next)
(global-set-key (kbd "C-<prior>") 'tab-previous)

(provide 'my-utils)
