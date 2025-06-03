(require 'package)

(add-to-list 'load-path "~/.emacs.d/packages/company-mode/")
(require 'company)
(setq company-minimum-prefix-length 2
      company-idle-delay 0.1
      company-selection-wrap-around t ;; cycle selection
      company-tooltip-align-annotations t
      company-tooltip-limit 6
      company-tooltip-flip-when-above t
      company-global-modes '(not message-mode eshell-mode))
;;(global-set-key (kbd "<tab>") #'company-indent-or-complete-common)
(global-company-mode)

(add-to-list 'load-path "~/.emacs.d/packages/citre/")
(require 'citre)
(require 'citre-config)
(global-set-key (kbd "C-x c j") 'citre-jump)
(global-set-key (kbd "C-x c J") 'citre-jump-back)
(global-set-key (kbd "C-x c p") 'citre-ace-peek)
(global-set-key (kbd "C-x c u") 'citre-update-this-tags-file)



(provide 'my-plugs)
