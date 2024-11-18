(defalias 'my-macro/double-to-single-quote
  (kmacro "C-M-% \" <return> ' C-e <backspace> <return> !"))

(defalias 'my-macro/single-to-double-quote
   (kmacro "C-M-% ' C-e <backspace> <return> \" C-e <backspace> <return> !"))

(defalias 'my-macro/insert-comma-at-the-end
  (kmacro "C-M-% $ <return> , <return> !"))

(defalias 'my-macro/insert-space-between-chars
  (kmacro "C-M-% \\ ( . ) <backspace> \\ ) _ <backspace> <return> \\ 1 SPC <return> !"))

(defalias 'my-macro/insert-hash-between-chars
  (kmacro "C-M-% \\ ( . ) <backspace> \\ ) _ <backspace> <return> \\ 1 SPC => SPC <return> !"))

(defalias 'my-macro/insert-hash-between-words
  (kmacro "C-M-% \\ ( \\ w + ) <backspace> \\ ) _ <backspace> <return> \\ 1 SPC => SPC <return> !"))

(defalias 'my-macro/insert-comma-between-words
  (kmacro "C-M-% \\ ( \\ w + ) <backspace> \\ ) _ <backspace> <return> \\ 1 , SPC <return> !"))

(defalias 'my-macro/insert-comma-between-chars
  (kmacro "C-M-% \\ ( . ) <backspace> \\ ) _ <backspace> <return> \\ 1 , <return> !"))

(defalias 'my-macro/insert-newline-between-chars
  (kmacro "C-M-% \\ ( [ [ : a l n u m : ] ] \\ ) _ <backspace> <return> \\ 1 C-q C-j <return> !"))


(provide 'my-macros)
