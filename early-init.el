;;; early-init.el --- loaded before graphical elements are initialized

;; Prevent package.el from loading at startup (we'll do it manually if needed)
(setq package-enable-at-startup nil)

;; Slightly faster startup
(setq inhibit-compacting-font-caches t)

;; No resize during init
(setq frame-resize-pixelwise t)

;; No startup screen / splash
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Default frame parameters (works both GUI and terminal)
(setq default-frame-alist
      '((fullscreen . maximized)          ; or nil if you prefer manual size
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)
        (ns-appearance . dark)            ; macOS only
        (ns-transparent-titlebar . t)))   ; macOS only
