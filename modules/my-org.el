(global-set-key (kbd "C-c a") #'org-agenda)
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org/gtd/"))
(setq org-agenda-diary-file "~/org/diary")
(setq diary-file "~/org/diary")
(setq org-agenda-custom-commands nil)
(setq org-tag-alist
      '(("@work" . ?w)
        ("@home" . ?h)
        ("@project" . ?p)
        ("@me" . ?m)
        ("@book" . ?b)
        ("@website" . ?i)
        ("@podcast" . ?d)
        ("@video" . ?v)))

(setq org-todo-keywords
      '((sequence "TODO(t)""HOLD(h)" "|" "DONE(d)")))

(setq org-capture-templates
      '("t" "Todo" entry
        (file"~/org/gtd/inbox.org")
        "* TODO %i%?%^G \n%T"))

(setq org-capture-templates
      '("n" "Quick Note" entry
        (file "~/org/notes/quick_notes.org")
        "* %^{heading} %t\n%?\n"))


(add-to-list 'org-agenda-custom-commands '("Q"."Custom Queries"))
(add-to-list 'org-agenda-custom-commands
             '("Qn" "Search Quick Notes" search "* "
               ((org-agenda-files (file-expand-wildcards "~/org/notes/quick_notes.org"))
                (org-agenda-prefix-format " "))))

(add-to-list 'org-agenda-custom-commands
             '("Qb" "Search Bookmarks" tags ""
               ((org-agenda-files (file-expand-wildcards "~/org/gtd/read.org"))
                (org-agenda-prefix-format " "))))

(add-to-list 'org-agenda-custom-commands
             '("g" "Get Things Done (GTD)"
               (
                (tags "inbox+TODO=\"TODO\"+PRIORITY=\"A\"|project+TODO=\"TODO\"+PRIORITY=\"A\"|read+TODO=\"TODO\"+PRIORITY=\"A\""
                      (
                       (org-agenda-prefix-format "  %?-12t% s [%e] ")
                       (org-agenda-overriding-header "\nGet thing Done\n")))
                (tags "inbox+TODO=\"TODO\"-PRIORITY=\"A\""
                      (
                       (org-agenda-prefix-format "  %?-12t% s ")
                       (org-agenda-overriding-header "\nInbox\n")))
                (tags "project+TODO=\"TODO\"-PRIORITY=\"A\""
                      ((org-agenda-prefix-format "  %?-12t% s [%e] ")
                       (org-agenda-overriding-header "\nProjects\n")))
                (tags "read+TODO=\"TODO\"-PRIORITY=\"A\""
                      ((org-agenda-prefix-format "  %?-12t% s")
                       (org-agenda-overriding-header "\nTo Read\n")))
                ;; (tags "+DEADLINE>=\"<today>\""
                ;; (tags "CLOSED>=\"<today>\""
                ;;       ((org-agenda-overriding-header "\nCompleted today\n")))
                (todo "HOLD"
                      ((org-agenda-skip-function
                        '(org-agenda-skip-entry-if 'deadline))
                       (org-agenda-prefix-format "  %?-12t% s ")
                       (org-agenda-overriding-header "\nHold\n"))))
               nil
               ("~/org/index.html")))

(defun my/org-inbox ()
  "Edit my emacs config"
  (interactive)
  (find-file "~/org/gtd/inbox.org"))

(global-set-key (kbd "<f10>") #'my/org-inbox)

(defun my/org-agenda-process-inbox-item ()
  "Process a single item in the org-agenda"
  (interactive)
  (org-with-wide-buffer
   (org-agenda-todo)
   (org-agenda-set-tags)
   (org-agenda-priority)
   (org-agenda-refile nil nil t)))
;;(define-key org-agenda-mode-map "r" 'my/org-agenda-process-inbox-item)


(defun my/agenda-deploy ()
  (when (s-prefix? (expand-file-name "~/org/gtd/") (buffer-file-name (current-buffer)))
    (let ((default-directory "~/org/"))
      (shell-command "rm index.html")
      (org-store-agenda-views)
      (start-process "" nil "sh" "deploy.sh"))
    )
  )

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'my/agenda-deploy)))




(provide 'my-org)
