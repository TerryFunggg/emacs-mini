;; Garbage collector tuning – less frequent GC during startup & normal use
(setq gc-cons-threshold (* 128 1024 1024))          ; 128 MB during normal use
(setq gc-cons-percentage 0.6)                       ; aggressive during startup
(setq read-process-output-max (* 1024 1024))        ; 1MB for LSP / large processes
;; Reset GC after startup (balance memory & speed)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))   ; 16 MB normal
            (setq gc-cons-percentage 0.1)))

;; Faster process output (helps eglot, shell)
(setq read-process-output-max (* 4 1024 1024))      ; 4MB

(setq use-short-answers t)                      ; y/n instead of yes/no
(setq confirm-kill-processes nil)               ; don't ask about subprocesses

(when (fboundp 'pixel-scroll-precision-mode)
  (pixel-scroll-precision-mode 1))

;; Better line wrapping & display
(setq-default truncate-lines nil)               ; wrap long lines
(setq-default word-wrap t)
(setq truncate-partial-width-windows nil)

;; Auto-revert buffers (very useful in 2025+ workflows)
(global-auto-revert-mode 1)
(setq auto-revert-use-notify nil)               ; avoid inotify spam on some systems
(setq global-auto-revert-non-file-buffers t)    ; revert dired, etc.

;; Better completion (built-in since Emacs 28+)
(setq completion-auto-select t)
(setq completion-cycle-threshold 3)
(setq tab-always-indent 'complete)              ; TAB completes if possible

;; Backup
(setq make-backup-files               nil ;; Disable (~file~)
      auto-save-default               nil ;; Disable (#file#)
      auto-save-list-file-prefix      nil
      backup-directory-alist          nil
      auto-save-file-name-transforms  nil
      kept-new-versions               0
      kept-old-versions               0)



;; windows
(setq help-window-select t              ; auto-focus help window
      help-window-select 'other-window) ; don't steal current window

(setq resize-mini-windows t
      max-mini-window-height 0.4)       ; max 40% of frame height

(setq completion-auto-help nil
      completion-auto-select nil)

;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (global-auto-revert-mode 1)            
(setq describe-bindings-show-icons t)


;; Recent
(require 'recentf)
(recentf-mode 1)

;; Ibuffer
(setq ibuffer-default-sorting-mode 'major-mode
      ibuffer-show-empty-filter-groups nil)

;; Keymaps
(global-set-key (kbd "C-x C-b") #'ibuffer)
