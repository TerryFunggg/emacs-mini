(defun my-func/list-template-dir ()
    "List template directory"
    (interactive)
    (find-file my-temp-dir))

(defun my-temp/new-my-module ()
    "Create my module template"
    (interactive)
    (erase-buffer)
    (insert (concat "(provide '" (file-name-base (buffer-name)) ")")))

(defun my-func/insert-template ()
  ""
  (interactive)
  (insert-file
   (concat
    my-temp-dir
    (ivy-completing-read
     "Insert: "
     (directory-files my-temp-dir nil directory-files-no-dot-files-regexp)))))


(provide 'my-template)
