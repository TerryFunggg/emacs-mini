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

;; fix correct keybindings
(when (eq system-type 'darwin)
		(setq mac-command-modifier 'super)
		(setq mac-option-modifier 'meta)
		(setq mac-control-modifier 'control))

(setq gc-cons-threshold 100000000)           ;; 100 mb
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq inhibit-startup-message t
      visible-bell nil)


(set-language-environment "utf-8")
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(setq text-quoting-style 'grave)
;; ======== System Setting END ========

;; ======== UI START ========
(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(setq ring-bell-function 'ignore)
;; ======== UI END ========

;; ======== FILE & BACKUP START ========
(global-auto-revert-mode t)         ;; revert file on change
(setq global-auto-revert-non-file-buffers t)
(setq bookmark-save-flag 1)         ;; auto save bookmarks
(setq make-backup-files nil
      backup-by-copying nil
      auto-save-default nil
      create-lockfiles nil)
(setq custom-file "~/.emacs.d/custom.el")
;; ======== FIEL & BACKUP END ========

;; ======== Convenience START ========
(defalias 'yes-or-no-p 'y-or-n-p)
(require 'uniquify)                  ;; pervent duplicate file name for selection
(setq uniquify-buffer-name-style 'forward)

;; completion config since emacs 29
(setq completion-styles '(flex)
      completion-auto-help 'visible
      completion-auto-select 'second-tab
      completions-max-height 10)

;; IDO mode

;; (use-package ido
;;   :config
;;   (setq ido-everywhere t
;;         ido-enable-flex-matching t
;;         ido-use-filename-at-point 'guess)
;;   (ido-mode 1)
;; )
(fido-mode 1)
(fido-vertical-mode 1)

;; active tab bar mode
(tab-bar-mode 1)
;; ======== Convenience END  ========

;; ======== Dired START ========
(require 'dired-x)
(setq dired-dwim-target t
      dired-recursive-copies 'top
      dired-recursive-deletes 'top
      dired-listing-switches "-alh"
      dired-kill-when-opening-new-dired-buffer t)

(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "-") #'dired-up-directory)
;; ======== Dired END ========

;; ======== Tab Config START ========
(setq-default tab-width 4)           ;; default was 8, too large
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent t)
(electric-indent-mode 0)
;; ======== Tab Config END ========

;; ======== Edit START ======
(delete-selection-mode 1)
(setq shift-select-mode nil)         ;; disable shift key for selection by default
(electric-pair-mode 1)
(setq sentence-end-double-space nil)
(global-hl-line-mode)
(setq show-paren-style 'parenthesis)
(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (show-paren-mode t)))
;; ======== Edit END ========

;; ======== Minibuffer START ========
(setq max-mini-window-height 0.2)
;; ======== Minibuffer END ========

;; Recentf
(recentf-mode 1)
;;(add-to-list 'recentf-exclude "\\private\\'" "\\opt\\'" "\\tmp\\'")

;; Project
(require 'project)
(mapcar
 (lambda (item)
   (push item vc-directory-exclusion-list))
 '(".cache" "__pycache__" "node_modules")) ;; ignore folder


;; Remember mode
(require 'remember)
(setq remember-data-file "~/notes/remember.org")

;; Tramp
(setq tramp-default-method "ssh")

;; other files
(setq my-temp-dir "~/.emacs.d/templates/")

;; ======== Modules START ========
(add-to-list 'load-path "~/.emacs.d/modules/")
(require 'my-utils)
(require 'my-langs)
;; language server, pick one only (lsp or eglot)
;;(require 'my-lsp)
(require 'my-eglot)
(require 'my-elfeed)
(require 'my-alias)
(require 'my-functions)
(require 'my-template)
(require 'my-keys)
(require 'my-macros)
(require 'my-org)
;; ======== Modules END ========

;; theme
;;(load-theme 'manoj-dark)
(load-theme 'leuven-dark)
;; Load custom file
(when (file-exists-p custom-file)
  (progn
    (load custom-file)))

;; startup
(my/org-inbox)
