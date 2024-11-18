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


(defun my/move-current-buffer-to-other-frame ()
  (interactive)
  "Move current window to other frame and close the source window"
  (let ((tempbuf (current-buffer)))
    (delete-window)
    (display-buffer-other-frame tempbuf)))

;; thx Xah provide the regx
;;http://xahlee.info/emacs/emacs/elisp_extract_url_command.html
(defun my-html/copy-url-from-line ()
  "Copy the url link (only first url) from current line"
  (interactive)
  (let ((line (string-trim-right (thing-at-point 'line t)))
        (result ""))
    (with-temp-buffer
      (insert line)
      (goto-char (point-min))
      (re-search-forward
       "<[A-Za-z]+.+?\\(href\\|src\\)[[:blank:]]*?=[[:blank:]]*?\\([\"']\\)\\([^\"']+?\\)\\2" nil t)
      (setq result (match-string-no-properties 3))
      (print (concat "Copied: " result))
      (kill-new result))))

(defun my/create-today-log ()
  (interactive)
  (let (log-file)
    (setq log-file
          (concat "~/notes/"
                  (format-time-string "%Y-%m-%d")
                  ".org"))
    (when (not (file-exists-p log-file))
      (progn
        (write-region "* Notes" nil log-file)))

    (find-file log-file)))

(provide 'my-functions)
