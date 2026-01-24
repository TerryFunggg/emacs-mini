(package-initialize)

;; Set global config values
(setq my-temp-dir "~/.emacs.d/templates/")

;; Load package
(let* ((dir (expand-file-name "extra" user-emacs-directory))
      (default-directory dir))
(when (file-directory-p dir)
  (add-to-list 'load-path dir)
  (normal-top-level-add-subdirs-to-load-path)))

;; Load package configs
(let ((after (expand-file-name "after" user-emacs-directory)))
  (dolist (pkg '(
                 "helper" "emacs" "dired" "org" "template"
                 "eglot" "python" "web" "cc"
                 ))
    (load (concat after "/" pkg ".el") nil 'nomessage)
    ))

(require 'exec-path-from-shell)
(setq exec-path-from-shell-arguments '("-l" "-i"))
(exec-path-from-shell-initialize)

(when (eq system-type 'darwin)
		(setq mac-command-modifier 'super)
		(setq mac-option-modifier 'meta)
		(setq mac-control-modifier 'control))

(setq inhibit-startup-screen t)

