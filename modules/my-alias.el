;; mark
(require 'expand-region)
(defalias 'mp 'mark-paragraph)
(defalias 'mall 'mark-whole-buffer)
(defalias 'mw 'er/mark-word)
(defalias 'mf 'make-frame-command)
(defalias 'murl 'er/mark-url)
(defalias 'm@ 'er/mark-email)
(defalias 'miq 'er/mark-inside-quotes)
(defalias 'maq 'er/mark-outside-quotes)
(defalias 'mip 'er/mark-inside-pairs)
(defalias 'map 'er/mark-outside-pairs)

(defalias 'ccut 'kill-region)
(defalias 'ccopy 'kill-region-save)
(defalias 'kal 'kill-whole-line)

(defalias 'lowercase 'downcase-region)
(defalias 'uppercase 'upcase-region)

(defalias 'dspc 'delete-horizontal-space)
(defalias 'dtab 'delete-indentation)

(defalias 'fff 'find-file)
(defalias 'ffw 'find-file-other-window)
(defalias 'fft 'find-file-other-tab)
(defalias 'ffo 'find-file-other-frame)
(defalias 'fff 'find-file)

(defalias 'wwu 'enlarge-window)
(defalias 'wwd 'shrink-window)
(defalias 'wwl 'shrink-window-horizontally)
(defalias 'wwr 'enlarge-window-horizontally)
(defalias 'bmset 'bookmark-set)

(defalias 'new-buffer 'scratch-buffer)
(defalias 'gtl 'goto-line)

(defalias 'cc 'compile)

(provide 'my-alias)
