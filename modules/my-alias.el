;; perfer command for rectangles


(global-unset-key (kbd "C-x r"))

;; remap mail
(global-unset-key (kbd "C-x m"))

;; remap register
(global-set-key (kbd "C-x m m") 'point-to-register)
(global-set-key (kbd "C-x m t") 'copy-to-register)
(global-set-key (kbd "C-x m i t") 'insert-register)
(global-set-key (kbd "C-x m +") 'increment-register)
(global-set-key (kbd "C-`") 'jump-to-register)
(global-set-key (kbd "C-x m w") 'window-configuration-to-register)
(global-set-key (kbd "C-x m f") 'frameset-to-register)
(global-set-key (kbd "C-x m b s") 'bookmark-set)
(global-set-key (kbd "C-x m b l") 'list-bookmarks)


(defun my/mark-at-point()
  (interactive)
  (push-mark))

;; mark
(require 'expand-region)
(defalias 'mp 'mark-paragraph)
(defalias 'mall 'mark-whole-buffer)
(defalias 'mw 'er/mark-word)
(defalias 'mf 'er/mark-defun)
(defalias 'murl 'er/mark-url)
(defalias 'm@ 'er/mark-email)
(defalias 'miq 'er/mark-inside-quotes)
(defalias 'maq 'er/mark-outside-quotes)
(defalias 'mip 'er/mark-inside-pairs)
(defalias 'map 'er/mark-outside-pairs)

(defalias 'ccut 'kill-region)
(defalias 'copy 'kill-region-save)
(defalias 'kal 'kill-whole-line)

(defalias 'lowercase 'downcase-region)
(defalias 'uppercase 'upcase-region)

(defalias 'dspc 'delete-horizontal-space)
(defalias 'dtab 'delete-indentation)

(defalias 'wwu 'enlarge-window)
(defalias 'wwd 'shrink-window)
(defalias 'wwl 'shrink-window-horizontally)
(defalias 'wwr 'enlarge-window-horizontally)


(provide 'my-alias)
