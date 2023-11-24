(use-package citre
  :defer t
  :init

  (require 'citre-config)
  (global-set-key (kbd "C-x c j") 'citre-jump)
  (global-set-key (kbd "C-x c J") 'citre-jump-back)
  (global-set-key (kbd "C-x c p") 'citre-ace-peek)
  (global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)
  :config
  (setq
   ;;citre-readtags-program "/path/to/readtags"
   ;;citre-ctags-program "/path/to/ctags"
   ;;citre-gtags-program "/path/to/gtags"
   ;;citre-global-program "/path/to/global"
   ;; Set this if you use project management plugin like projectile.  It's
   ;; used for things like displaying paths relatively, see its docstring.
   ;;citre-project-root-function #'projectile-project-root
   ;; Set this if you want to always use one location to create a tags file.
   ;;citre-default-create-tags-file-location 'global-cache
   ;; See the "Create tags file" section above to know these options
   ;;citre-use-project-root-when-creating-tags t
   ;;citre-prompt-language-for-ctags-command t
   ;; By default, when you open any file, and a tags file can be found for it,
   ;; `citre-mode' is automatically enabled.  If you only want this to work for
   ;; certain modes (like `prog-mode'), set it like this.
   citre-auto-enable-citre-mode-modes '(prog-mode)))


;;;; Auto enabling `citre-mode'

;; This is autoloaded in citre.el so it's usable.
;;(declare-function citre-auto-enable-citre-mode "citre")
;;(add-hook 'find-file-hook #'citre-auto-enable-citre-mode)



(provide 'my-citre)
