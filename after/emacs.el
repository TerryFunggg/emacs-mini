;; ============================================================================
;;  Core built-in improvements
;; ============================================================================

(setq inhibit-startup-screen           t)
(setq use-short-answers                t)     ; y/n instead of yes/no
(setq ring-bell-function              'ignore)
(setq visible-bell                    t)

;; Sane scrolling & cursor
(setq scroll-conservatively           101)
(setq scroll-margin                    2)
(setq auto-window-vscroll             nil)

;; Better defaults
(setq-default indent-tabs-mode        nil)
(setq-default tab-width                4)
(setq-default fill-column             100)

(setq delete-by-moving-to-trash       t)
(setq make-backup-files               nil)
(setq auto-save-default               nil)
(setq backup-by-copying               nil)
(setq create-lockfiles                nil)

(setq confirm-kill-processes          nil)  ; don't ask about subprocesses

;; Recent files
(recentf-mode 1)
(setq recentf-max-saved-items        100)

(global-auto-revert-mode t)         ;; revert file on change
(setq bookmark-save-flag 1)         ;; auto save bookmarks

;; Show matching parens
(show-paren-mode 1)

;; Delete selection when typing
(delete-selection-mode 1)
(setq shift-select-mode nil)            ;; disable shift key selection

;; Pixel-perfect scrolling in GUI
(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode 1))

;; Ibuffer
(setq ibuffer-default-sorting-mode 'major-mode
      ibuffer-show-empty-filter-groups nil)

;; completions
(setq 
      completion-styles      '(flex)
      completion-auto-help   'visable
      completion-auto-select 'second-tab
      completions-max-height 10
)


;; windows
(setq help-window-select t              ; auto-focus help window
      help-window-select 'other-window) ; don't steal current window

(setq resize-mini-windows t
      max-mini-window-height 0.2)       ; max 20% of frame height

(winner-mode 1)
(global-set-key (kbd "M-<left>")  #'winner-undo)
(global-set-key (kbd "M-<right>") #'winner-redo)

;; Better line wrapping & display
(setq-default truncate-lines nil)               ; wrap long lines
(setq-default word-wrap t)
(setq truncate-partial-width-windows nil)

;; ============================================================================
;;  Appearance & terminal compatibility

;; Display number line
(global-display-line-numbers-mode 1)
;; Show column number
(column-number-mode 1)

;; Highlight current line (subtle)
(global-hl-line-mode 1)

;; Terminal friendly adjustments
(when (not (display-graphic-p))
  (setq-default truncate-lines t))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ============================================================================
;;  Programming / text defaults
;; ============================================================================
(set-language-environment   "utf-8")
(set-default-coding-systems 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(setq text-quoting-style    'grave)
(electric-pair-mode 1)

;; basic tabs
(setq tab-always-indent t)           ; TAB completes if possible
(setq-default tab-width 4)           ; default was 8, too large
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent t)
(electric-indent-mode 0)

;; =============================================================================
;; fIdo mode – built-in flexible minibuffer completion
;; =============================================================================
(fido-mode 1)
(fido-vertical-mode 1)

;; =============================================================================
;; project - build-in project managenment
;; =============================================================================
(require 'project)
(mapcar
 (lambda (item)
   (push item vc-directory-exclusion-list))
 '(".cache" "__pycache__" "node_modules" "eln-cache")) ;; ignore folder


;; =============================================================================
;; Tramp config
;; =============================================================================
(setq tramp-default-method "ssh")


;; ============================================================================
;;  Basic keybindings & convenience
;; ============================================================================

;; unbind
(global-unset-key (kbd "C-x n")) ;; narrowing
(global-unset-key (kbd "C-x m")) ;; email
(global-unset-key (kbd "C-x w")) ;; highlight duplicate with M-s h
(global-unset-key (kbd "C-x C-n")) ;; disable global column
(global-unset-key (kbd "C-x C-j")) ;; duplicate with C-x C-d with C-x C-f
(global-unset-key (kbd "C-x C-o")) ;; is for delete-blank-line
(global-unset-key (kbd "C-x C-d")) ;; disable list directory
(global-unset-key (kbd "C-c C-f")) ;; disable elisp byte compile
(global-unset-key (kbd "C-x f"))   ;; fill column

;; bind
(global-set-key (kbd "C-x C-j") 'delete-blank-lines) ;;is good to use j - join for me remember the key
(global-set-key (kbd "C-x C-d") 'dired-jump)
(global-set-key (kbd "C-x C-b") #'ibuffer)           ; better buffer list
(global-set-key (kbd "M-/")     #'hippie-expand)     ; better than dabbrev
(global-set-key (kbd "C-c r")   #'recentf-open-files)
(global-set-key (kbd "C-c s") 'grep-find)
(global-set-key (kbd "C-<next>") 'tab-next)
(global-set-key (kbd "C-<prior>") 'tab-previous)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "C-c $") #'my/eshell-popup)
;;(global-set-key (kbd "C-c d") 'xref-find-definitions-other-window)
(global-set-key (kbd "C-c C-d") 'my/toggle-window-dedicated)
;; (global-set-key (kbd "C-<f12>") 'my-func/emacs-config)
;; (global-set-key (kbd "C-<f11>") 'my-func/modules-config)
(global-set-key (kbd "C-^") 'my/move-current-buffer-to-other-frame)
(global-set-key (kbd "M-'") 'eldoc-doc-buffer)


;; ============================================================================
;;  Window
;; ============================================================================
(add-to-list 'display-buffer-alist
             '("\\*xref\\*"
               (display-buffer-reuse-window display-buffer-in-side-window)
               (side            . bottom)
               (slot            . 0)
               (window-height   . 0.25)           ; 25% of frame height
               (window-parameters . ((mode-line-format . nil)))))

;; ============================================================================
;;  Theme
;; ============================================================================
(require 'catppuccin-theme)
(load-theme 'catppuccin :no-confirm)

;; Load custom file
;; (when (file-exists-p custom-file)
;;   (progn
;;     (load custom-file)))

;; Final message
(message "Emacs ready (%.2fs)" (float-time (time-subtract (current-time) before-init-time)))




