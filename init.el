(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (eval-when-compile (require 'use-package)))
(package-initialize)

(setq use-package-always-ensure t)
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; system init
(set-face-attribute 'default nil :height 160) ;; 14px font size
(set-language-environment "utf-8")
(set-default-coding-systems 'utf-8-unix)
(setq inhibit-startup-screen t)
(setq make-backup-files t)
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/backup")))
(setq auto-save-default nil)
(setq create-lockfiles nil)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t) ;; auto refresh buffer
(setq auto-revert-verbose nil)
(setq custom-file (make-temp-file "custom"))

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
;;(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default dired-listing-switches "-alh")
(load-theme 'manoj-dark)


;; TAB config
(set-default 'tab-always-indent 'complete)
(setq-default indent-tabs-mode)
(setq-default tab-width 4)
(setq sentence-end-double-space nil)

;; paren
(show-paren-mode t)
(setq show-paren-style 'expression)

;;other
(setq my-temp-dir "~/.emacs.d/templates/")

(add-to-list 'load-path "~/.emacs.d/modules/")
(require 'my-emacs-util)
(require 'my-better-edit)
(require 'my-company)
(require 'my-utils)
(require 'my-langs)
(require 'my-elfeed)
(require 'my-alias)
(require 'my-functions)
(require 'my-template)
(require 'my-keys)
(require 'my-macros)

(require 'my-org)
