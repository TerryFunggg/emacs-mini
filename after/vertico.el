(require 'vertico)
(vertico-mode 1)

(setq vertico-resize nil                ; keep minibuffer height fixed → cleaner look
      vertico-count 12                  ; show more candidates (nano users often like 10–15)
      vertico-cycle t                   ; cycle back to top/bottom
      vertico-preselect 'directory      ; important for find-file / dired usability
      vertico-scroll-margin 2           ; small margin at top/bottom
      completion-ignore-case t          ; case-insensitive everywhere
)
