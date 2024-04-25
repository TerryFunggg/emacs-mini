(defun my-func/reverse-region-chars (beg end)
  "Reverse characters on the region"
  (interactive "r")
  (let ((region (buffer-substring beg end)))
    (delete-region beg end)
    (insert (nreverse region))))


(defun my-func/reverse-region-words (beg end)
  "Reverse words on the region"
  (interactive "r")
  (let ((region (buffer-substring beg end)))
    (delete-region beg end)
    (insert (string-join (reverse (split-string region "[[:space:]]")) " "))))


(defun my-func/emacs-config ()
    "Edit my emacs config"
    (interactive)
    (find-file "~/.emacs.d/init.el"))

(defun my-func/modules-config ()
    "Edit my emacs config"
    (interactive)
    (find-file "~/.emacs.d/modules/"))

(defun my-func/fzf-find-file ()
  "Sources from git repo, else find from current directory "
  (interactive)
  (condition-case err
      (funcall 'fzf-git)
    (error
     (funcall 'fzf-find-file-in-dir))))


(defun my/display-current-buffer-other-frame-close-window ()
  (interactive)
  "Display current buffer to other frame and close the origin window"
  (let ((tempbuf (current-buffer)))
    (delete-window)
    (display-buffer-other-frame tempbuf)))


(current-buffer)
(display-buffer-other-frame)

(provide 'my-functions)
