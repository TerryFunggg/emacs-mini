(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

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
(global-auto-revert-mode t)
(setq bookmark-save-flag 1)         ;; auto save bookmarks
(setq make-backup-files t
      backup-by-copying t
      backup-directory-alist `(("." . "/tmp/file_backup"))
      auto-save-file-name-transforms `((".*" "/tmp/file_backup" t))
      auto-save-default nil
      create-lockfiles nil
      )
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
;; ======== Convenience END  ========


;; ======== Dired START ========
(setq dired-dwim-target t
      dired-recursive-copies 'top
      dired-recursive-deletes 'top
      dired-listing-switches "-alh"
      dired-kill-when-opening-new-dired-buffer t)

(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-x)
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
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
(setq sentence-end-double-space nil)

;; ======== Edit END ========

;; ======== Minibuffer START ========
(setq max-mini-window-height 0.2)
;; ======== Minibuffer END ========


;; ======== Tools START ========

;; Recentf
(recentf-mode 1)
(add-to-list 'recentf-exclude 
             "\\private\\'" "\\opt\\'" "\\tmp\\'")

;; Project
(require 'project)
(mapcar 
 (lambda (item) 
   (push item vc-directory-exclusion-list)) 
 '(".cache" "__pycache__" "node_modules")) ;; ignore folder

;; Tramp
(setq tramp-default-method "ssh")

;; ======== Tools END ========

;; ======== Module Import START ========
(add-to-list 'load-path "~/.emacs.d/modules/")
(require 'my-plugs)
(require 'my-alias)
(require 'my-functions)
(require 'my-keys)
(require 'my-org)

;; other plugs
(require 'flycheck-pos-tip)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
;; ======== Module Import END ========

;; THEME
(load-theme 'deeper-blue)

;; other custom config put into custom files
;; Because some style settings depent on user favor or user computer
;; like font size and font family.
(setq custom-file "~/.config/emacs-custom.el")
(when (file-exists-p custom-file)
  (progn
    (load custom-file)))

