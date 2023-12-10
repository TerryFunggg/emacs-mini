(defalias 'single-to-double
  (kmacro "C-M-% ' <return> \" <return>"))
(defalias 'double-to-single
  (kmacro "C-M-% \" <return> \' <return>"))

(defalias 'insert-comma-at-the-end
  (kmacro "C-M-% $ <return> , <return> !"))

(defalias 'insert-space-between-chars
  (kmacro "C-M-% \\ ( . ) <backspace> \\ ) _ <backspace> <return> \\ 1 SPC <return> !"))

(defalias 'insert-hash-between-chars
  (kmacro "C-M-% \\ ( . ) <backspace> \\ ) _ <backspace> <return> \\ 1 SPC => SPC <return> !"))

(defalias 'insert-hash-between-words
  (kmacro "C-M-% \\ ( \\ w + ) <backspace> \\ ) _ <backspace> <return> \\ 1 SPC => SPC <return> !"))

(defalias 'insert-comma-between-words
  (kmacro "C-M-% \\ ( \\ w + ) <backspace> \\ ) _ <backspace> <return> \\ 1 , SPC <return> !"))

(defalias 'insert-comma-between-chars
  (kmacro "C-M-% \\ ( . ) <backspace> \\ ) _ <backspace> <return> \\ 1 , <return> !"))

(defalias 'insert-newline-between-chars
  (kmacro "C-M-% \\ ( [ [ : a l n u m : ] ] \\ ) _ <backspace> <return> \\ 1 C-q C-j <return> !"))


(provide 'my-macros)
