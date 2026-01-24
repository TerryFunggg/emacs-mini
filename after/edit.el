(setq-default
 indent-tabs-mode nil              ; use spaces, not tabs (most modern projects prefer this)
 tab-width 4                       ; visual width of TAB character = 4 spaces
 standard-indent 4                 ; default indent level
 tab-always-indent 'complete       ; TAB tries to complete if possible, else indent
 electric-indent-mode -1
 backward-delete-char-untabify-method 'hungry  ; delete all spaces at once if possible
 )

(delete-selection-mode 1)
