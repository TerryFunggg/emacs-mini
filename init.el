(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
                     '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives
                     '("melpa" . "http://melpa.org/packages/"))

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


;; System init
(set-face-attribute 'default nil :height 140) ;; 14px font size
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
;;(defalias 'yes-or-no-p 'y-or-n-p)


;; Dired
(setq dired-dwim-target t)
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(require 'dired-x)
(define-key dired-mode-map (kbd "-") #'dired-up-directory)

;; ido mode
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer nil)
(setq ido-use-virtual-buffers t)
(setq ido-use-face t)
(setq ido-max-window-height 1)
(setq ido-decorations
      '("" "" "   |   " " | ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))

(ido-mode 1)
(global-set-key (kbd "C-x C-f") 'ido-dired)
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
;;(use-package dracula-theme)
(use-package leuven-theme)
(load-theme 'leuven t)


(add-to-list 'load-path "~/.emacs.d/modules/")
(require 'my-alias)
(require 'my-better-edit)
(require 'my-company)
(require 'my-utils)
(require 'my-langs)
