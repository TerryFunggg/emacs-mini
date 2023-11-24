(use-package citre)

(declare-function citre-auto-enable-citre-mode "citre")
(add-hook 'find-file-hook #'citre-auto-enable-citre-mode)

(global-set-key (kbd "C-x c j") 'citre-jump)
(global-set-key (kbd "C-x c J") 'citre-jump-back)
(global-set-key (kbd "C-x c p") 'citre-peek)
(global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)

(provide 'my-citre)
