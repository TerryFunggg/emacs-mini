(defun my/reverse-region-chars (beg end)
  "Reverse characters on the region"
  (interactive "r")
  (let ((region (buffer-substring beg end)))
    (delete-region beg end)
    (insert (nreverse region))))


(defun my/reverse-region-words (beg end)
  "Reverse words on the region"
  (interactive "r")
  (let ((region (buffer-substring beg end)))
    (delete-region beg end)
    (insert (string-join (reverse (split-string region "[[:space:]]")) " "))))

(provide 'my-functions)
