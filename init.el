(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


;; use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (eval-when-compile (require 'use-package)))
;;(package-initialize)

(setq use-package-always-ensure t)


;; GC
(setq gc-cons-threshold 10000000)
  ;; Restore after startup
(add-hook 'after-init-hook
            (lambda ()
               (setq gc-cons-threshold 1000000)
              (message "gc-cons-threshold restored to %S"
                       gc-cons-threshold)))

;; System init
(set-language-environment "utf-8")
(set-default-coding-systems 'utf-8-unix)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t) ;; auto refresh buffer
(setq auto-revert-verbose nil)
(setq custom-file (make-temp-file "custom"))


(require 'recentf)
(recentf-mode 1)
(global-set-key (kbd "C-c r") 'recentf-open-files)
(add-to-list 'recentf-exclude "\\private\\'" "\\opt\\'")

;; UI
(column-number-mode 1)
(blink-cursor-mode 0)
(global-visual-line-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(global-display-line-numbers-mode t)

(setq show-paren-style 'parenthesis)
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)

(set-frame-font "JetBrains Mono 12" nil t)


;; Dired
(setq dired-dwim-target t)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(require 'dired-x)
(define-key dired-mode-map (kbd "-") #'dired-up-directory)

;; Tramp mode
(setq tramp-default-method "ssh")

;; TAB config
(electric-indent-mode 0)

(set-default 'tab-always-indent 'complete)
(setq-default indent-tabs-mode)
(setq-default tab-width 4)

(setq sentence-end-double-space nil)

;; Own
(defun my/emacs-config ()
    "Edit my emacs config"
    (interactive)
    (find-file "~/.emacs.d/init.el"))

;; Packages
(use-package crux
    :bind (("C-a" . crux-move-beginning-of-line)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package ace-window)
(global-set-key (kbd "C-x 0") 'ace-window)

(use-package avy)
(global-set-key (kbd "C-c .") 'avy-goto-char-timer)

(use-package magit)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

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
        fzf/position-bottom t
        fzf/window-height 15)
)
(global-set-key (kbd "C-c f") 'fzf-find-file)
(global-set-key (kbd "C-c r") 'fzf-recentf)
(global-set-key (kbd "C-c p") 'fzf-projectile)
(global-set-key (kbd "C-c g") 'fzf-git-files)
(global-set-key (kbd "C-x b") 'fzf-switch-buffer)

;;(use-package ag)

(use-package rg)
;;(require 'rg-isearch)
;;(define-key isearch-mode-map "\M-sr" 'rg-isearch-menu)
(global-set-key (kbd "C-c C-s") 'rg)

(use-package ivy)
(use-package counsel)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;(global-set-key (kbd "C-c C-s") 'counsel-rg)
(ivy-mode)

(icomplete-mode 1)

(use-package projectile)

(use-package company
  :config
  (global-company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

;; theme
(use-package dracula-theme)
(load-theme 'dracula t)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))


(add-to-list 'load-path "~/.emacs.d/lib/")
(require 'my-alias)
