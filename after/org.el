(require 'org)

(setq org-directory                   "~/org/"
      org-default-notes-file          (expand-file-name "inbox.org" org-directory)
      org-startup-indented            t
      org-startup-folded              'content
      org-startup-with-latex-preview  t
      org-startup-with-inline-images  t
      org-hide-emphasis-markers       t
      org-hide-block-startup          nil
      
      calendar-set-date-style         'iso

      ;; Agenda & capture
      org-agenda-files                '("~/org/gtd/")
      org-agenda-span                 'week
      org-agenda-custom-commands      nil
      ;; Refile
      org-refile-targets          '((org-agenda-files :maxlevel . 4)
                                    (nil :maxlevel . 4))
      org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil
      org-refile-allow-creating-parent-nodes 'confirm
)


;; ── Todo keywords  ───────────────────────────────────────────────
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
        (sequence "PROJ(p)" "|" "FINISHED(f@)")
        ))

(setq org-todo-keyword-faces
      '(("NEXT"      . (:foreground "#E5C07B" :weight bold))
        ("TODO"      . (:foreground "#98C379" :weight bold))
        ("PROJ"      . (:foreground "#61AFEF" :weight bold))
        ("FINISHED"  . (:foreground "gray60" :strike-through t))))


;; ── Tags keywords  ───────────────────────────────────────────────
(setq org-tag-alist
      '(("@work" . ?w)
        ("@project" . ?p)
        ("@me" . ?m)
        ("@code" . ?c)
        ("@book" . ?b)
        ("@website" . ?i)
        ("@podcast" . ?d)
        ("@video" . ?v)))


;; ── Capture templates ────────────────────────────────────────────────────
(setq org-capture-templates
      `(
        ("i" "Inbox" entry 
         (file "~/org/gtd/inbox.org")
         "* TODO %?\n  %U\n" :prepend t)
        ("i" "Inbox + link" entry 
         (file "~/org/gtd/inbox.org")
         "* TODO %?\n  %U\n  %a" :prepend t)))


;; ── Agenda templates ────────────────────────────────────────────────────
(setq org-agenda-custom-commands
      '(("p" "Today + Next actions"
         ((agenda "" ((org-agenda-span 'day)
                       (org-deadline-warning-days 7)))
          (todo "PROJ"
                ((org-agenda-overriding-header "Active projects")))
          (todo "NEXT"
                ((org-agenda-overriding-header "Next actions")))
          (todo "TODO"
                ((org-agenda-overriding-header "TODO")
                 (org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'regexp ":PROJECT:")))))
         nil)))

;; ── Babel – code blocks ──────────────────────────────────────────────────
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python     . t)
   (shell      . t)
   (js         . t)))


;; ── Appearance tweaks ────────────────────────────────────────────────────
(custom-set-faces
 '(org-level-1 ((t (:height 1.3 :weight bold))))
 '(org-level-2 ((t (:height 1.2 :weight bold))))
 '(org-level-3 ((t (:height 1.15 :weight bold))))
 '(org-done    ((t (:strike-through t :weight bold))))
 '(org-todo    ((t (:weight bold)))))


;; Better bullets / list appearance
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1)
                                                        (match-end 1) "•"))))))

(defun my/org-inbox ()
  (interactive)
  (find-file (expand-file-name "gtd/inbox.org" org-directory)))

(defun my/org-agenda-projects ()
  (interactive)
  (org-agenda nil "p"))


;; Quick access to common files
(global-set-key (kbd "C-c C-c") 'my/org-inbox)

;; ── Hooks ──────────────────────────────────────────────────────────────────
(add-hook 'org-mode-hook
          (lambda ()
            ;; Visual line wrap
            (visual-line-mode 1)
            ;; Flyspell for prose
            (when (derived-mode-p 'org-mode)
              (flyspell-mode 1))
            ;; Better electric pairs in src blocks
            (electric-pair-local-mode -1)))


;; ── Keybindings ──────────────────────────────────────────────────────────
(global-set-key (kbd "C-c a")   #'org-agenda)
(global-set-key (kbd "C-c c")   #'org-capture)


(defun my/org-startup-agenda ()
  (interactive)
  (org-agenda nil "p")
  (delete-other-windows)
)

;; Run agenda on startup
(add-hook 'emacs-startup-hook #'my/org-startup-agenda)
