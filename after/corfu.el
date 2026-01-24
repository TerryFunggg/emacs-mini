(require 'corfu)
(require 'cape)

;; load popup
(load (expand-file-name "corfu-popupinfo.el" (concat user-emacs-directory "extra/corfu/extensions/")) nil 'nomessage)
(require 'corfu-popupinfo)
(corfu-popupinfo-mode 1)

(global-corfu-mode 1)

;; Recommended settings (balanced, nano-friendly)
(setq corfu-auto             t            ; auto popup
      corfu-auto-delay       0.1         
      corfu-auto-prefix      1            
      corfu-preselect        'prompt      ; don't auto-select first → safer
      corfu-on-exact-match   'insert      ; insert exact match if only one
      corfu-cycle            t            ; cycle candidates
      corfu-separator        ?            ; insert separator with M-,
      corfu-quit-at-boundary 'separator   ; quit on boundary unless separator
      corfu-quit-no-match    'separator   ; same for no match
      corfu-scroll-margin    5            ; small margin for nicer scrolling
      corfu-maximum-size     15           ; limit candidates shown (cleaner popup)
      corfu-preview-current  'insert      ; preview current in buffer

      corfu-border-width     1
      corfu-popupinfo-delay  1
      )


(add-to-list 'completion-at-point-functions #'cape-file)        ; path completion
(add-to-list 'completion-at-point-functions #'cape-dabbrev)     ; text expansion
(add-to-list 'completion-at-point-functions #'cape-keyword)     ; programming keywords
(add-to-list 'completion-at-point-functions #'cape-symbol)      ; elisp symbols

(require 'nerd-icons)
(require 'nerd-icons-corfu)
(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)




