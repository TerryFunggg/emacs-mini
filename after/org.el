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
)


;; ── Todo keywords  ───────────────────────────────────────────────
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")))

(setq org-todo-keyword-faces
      '(("NEXT"      . +todo-keyword-next-face)))


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
      `(("i" "Inbox" entry 
         (file (expand-file-name "gtd/inbox.org" org-directory))
         "* TODO %?\n  %U\n  %a" :prepend t)))


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

;; Quick access to common files
(global-set-key (kbd "C-c i")   (lambda () (interactive) (find-file (expand-file-name "gtd/inbox.org" org-directory))))

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

