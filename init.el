(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)


;; use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (eval-when-compile (require 'use-package)))
(package-initialize)

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

;;(set-frame-font "JetBrains Mono 12" nil t)


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

(defun my/modules-config ()
    "Edit my emacs config"
    (interactive)
    (find-file "~/.emacs.d/modules/"))

;; theme
(use-package dracula-theme)
(load-theme 'dracula t)


(add-to-list 'load-path "~/.emacs.d/modules/")
(require 'my-alias)
(require 'my-better-edit)
(require 'my-ivy)
(require 'my-window)
(require 'my-company)
(require 'my-fzf)
(require 'my-rg)
(require 'my-projectile)
(require 'my-magit)
(require 'my-docker)
(require 'my-web-mode)
(add-to-list 'load-path "~/.emacs.d/meow/")
(require 'meow)
;;(require 'my-evil)
(require 'my-meow)
;;(require 'my-keymaps)
