(global-unset-key (kbd "C-x C-n")) ;;
(global-unset-key (kbd "M-g c")) ;; goto-char
(global-unset-key (kbd "M-g M-g")) ;; go to line
(global-unset-key (kbd "M-g g")) ;; go to line
(global-unset-key (kbd "M-g TAB"))
(global-unset-key (kbd "C-@"));; set-mark-command
(global-unset-key (kbd "C-x C-l"));; lower case
(global-unset-key (kbd "C-x C-u"));; upper case
(global-unset-key (kbd "M-$"))

(defun my/mark-at-point()
  (interactive)
  (push-mark))


;; mark
(require 'expand-region)
(defalias 'mm 'my/mark-at-point) ;; or C-SPC C-SPC
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

(defalias 'cut 'kill-region)
(defalias 'copy 'kill-region-save)

(defalias 'lowercase 'downcase-region)
(defalias 'uppercase 'upcase-region)

(defalias 'wwu 'enlarge-window)
(defalias 'wwd 'shrink-window)
(defalias 'wwl 'shrink-window-horizontally)
(defalias 'wwr 'enlarge-window-horizontally)


(provide 'my-alias)
