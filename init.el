(package-initialize)

;; Load package
(let* ((dir (expand-file-name "extra" user-emacs-directory))
      (default-directory dir))
(when (file-directory-p dir)
  (add-to-list 'load-path dir)
  (normal-top-level-add-subdirs-to-load-path)))

;; Load package configs
(let ((after (expand-file-name "after" user-emacs-directory)))
  (dolist (pkg '(
                 "vertico" "marginalia" "orderless" "embark"
		         "consult" "corfu" "eglot" "emacs" "dired"
		         "edit" "org"
                 ))
    (load (concat after "/" pkg ".el") nil 'nomessage)
    ))

(require 'exec-path-from-shell)
(setq exec-path-from-shell-arguments '("-l" "-i"))
(exec-path-from-shell-initialize)

(setq inhibit-startup-screen t)

