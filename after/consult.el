(require 'consult)

(setq consult-preview-key '(:debounce 0.4 any)    ; preview after short delay (prevents lag on slow machines)
      consult-preview-buffer-size-limit 1024      ; don't preview huge files
      consult-preview-excluded-files '("/COMMIT_EDITMSG$" "/elpa/")  ; skip junk
      consult-preview-raw-size 1024               ; limit raw size for speed

      ;; History & sorting – make repeated use smarter
      consult-preview-history t                   ; preview history entries
      consult-persist-state nil                   ; optional: persist state across sessions (needs savehist)
)


(keymap-global-set "C-x b"     #'consult-buffer)
(keymap-global-set "C-c C-f"   #'consult-find)
(keymap-global-set "C-c g"     #'consult-ripgrep)
(keymap-global-set "M-y"       #'consult-yank-pop)
(keymap-global-set "C-c r"     #'consult-recent-file)
(keymap-global-set "M-g o"     #'consult-outline)


(when (bound-and-true-p project-prefix-map)
  (keymap-set project-prefix-map "b" #'consult-project-buffer)
  (keymap-set project-prefix-map "f" #'consult-find))
