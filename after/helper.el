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

(defun my/toggle-window-dedicated ()
  "Toggle the current window as dedicated to its buffer."
  (interactive)
  (let ((win (selected-window)))
    (set-window-dedicated-p win (not (window-dedicated-p win)))
    (message "Window %s" (if (window-dedicated-p win) "dedicated" "normal"))))


(defun my/notes-grep ()
  "Run grep-find on my notes directory (case-insensitive)."
  (interactive)
  (let* ((keyword (read-string "Enter search keyword: "))
         (grep-find-command
          (format "find ~/notes/*.org -type f -exec grep -i -nH -e %s {} +" (shell-quote-argument keyword))))
    (grep-find grep-find-command)))

(defun my-func/list-template-dir ()
    "List template directory"
    (interactive)
    (find-file my-temp-dir))

(defun my-func/insert-template ()
  ""
  (interactive)
  (insert-file
   (concat
    my-temp-dir
    (ivy-completing-read
     "Insert: "
     (directory-files my-temp-dir nil directory-files-no-dot-files-regexp)))))

(defun my/eshell-popup ()
  "Open eshell in a bottom window taking 25% of frame height."
  (interactive)
  (let ((eshell-buffer (get-buffer-create "*eshell-popup*")))
    ;; Switch to eshell in that buffer (creates if needed)
    (with-current-buffer eshell-buffer
      (unless (derived-mode-p 'eshell-mode)
        (eshell-mode)))

    ;; Display it in a bottom window
    (display-buffer eshell-buffer
                    `(display-buffer-in-side-window
                      (side          . bottom)
                      (slot          . 0)
                      (window-height . 0.25)
                      (window-parameters . ((mode-line-format . (" Eshell"))))))

    ;; Select the new window and give focus
    (select-window (get-buffer-window eshell-buffer))
    (goto-char (point-max))
    (eshell-bol)))
