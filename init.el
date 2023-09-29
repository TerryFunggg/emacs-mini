(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (eval-when-compile (require 'use-package)))


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
(setq make-backup-files -1)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(global-auto-revert-mode 1)
(setq custom-file (make-temp-file "custom"))


(require 'recentf)
(recentf-mode 1)

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

;; Dired
(setq dired-dwim-target t)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(require 'dired-x)

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

(use-package god-mode)
;;(global-set-key (kbd "<escape>") #'god-mode-all)
;;(global-set-key (kbd "<f12>") 'my/emacs-config)

(use-package ace-window)

(global-set-key (kbd "C-x C-w") #'ace-window)

(use-package avy
  :bind ("C-." ("Jump to char" . avy-goto-char-timer)))

(use-package magit)

(use-package expand-region
    :bind ("C-=" . er/expand-region))

(use-package helm
  :config
  (helm-mode 1)
  (setq
   helm-split-window-in-side-p t
   helm-move-to-line-cycle-in-source t
   helm-ff-search-library-in-sexp t
   helm-scroll-amount 10
   helm-ff-file-name-history-use-recentf t
   helm-echo-input-in-header-line t)

  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-unset-key (kbd "C-x c"))
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-x") 'helm-M-x))

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; init screen
(setq helm-mini-default-sources '(helm-source-recentf
                                  helm-source-bookmarks))
;;(god-mode)
