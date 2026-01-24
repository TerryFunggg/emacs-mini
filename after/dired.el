(setq dired-dwim-target t
      dired-do-revert-buffer t
      dired-listing-switches "-alh --group-directories-first"
      dired-recursive-copies 'always
      dired-recursive-deletes 'always
      )

(with-eval-after-load 'dired
  ;; Quick toggle details / all marks
  (define-key dired-mode-map (kbd "U")   #'dired-unmark-all-marks)   ; clear all marks
  (define-key dired-mode-map (kbd "-") #'dired-up-directory) ; Shift-Tab = parent dir
  ;; Quick operations
  (define-key dired-mode-map (kbd "y")     #'dired-copy-filename-as-kill) ; yank filename
  ;; Refresh & sort
  (define-key dired-mode-map (kbd "g")     #'revert-buffer)          ; refresh
  )

;; Open file with system default app (xdg-open / open / start)
(defun my/dired-open-file-externally ()
  "Open marked files or file at point with default system app."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (file-directory-p file)
        (message "Cannot open directory externally")
      (start-process "" nil
                     (cond ((eq system-type 'darwin) "open")
                           ((eq system-type 'gnu/linux) "xdg-open")
                           ((eq system-type 'windows-nt) "start"))
                     (expand-file-name file)))))


(require 'nerd-icons)
(require 'nerd-icons-dired)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)
