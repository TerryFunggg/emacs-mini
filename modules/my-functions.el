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
        (write-region "" nil log-file)))

    (find-file log-file)))

;; C lang hook
(defun my/compile-c-project()
  "Call emacs build-in compile command"
  (interactive)
  (save-buffer)
  (let* ((project-dir (locate-dominating-file default-directory "Makefile"))
         (makefile-exists (and project-dir (file-exists-p (concat project-dir "Makefile")))))
    (if makefile-exists
        ;; if Emacs find Makefile under projects:
        (progn
          (compile (format "cd %s && make" project-dir))
          (message (format "Compiled %s" (concat project-dir "Makefile"))))
      ;; Else, no any Makefile found, let user type command
      (compile (read-string "Compile command: " "")))))
(define-key c-mode-map (kbd "C-c x") 'my/compile-c-project)

(provide 'my-functions)
