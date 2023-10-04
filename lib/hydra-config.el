;; my ace window
(defun ide-window-mode ()
  ""
  (interactive)
  (en)
(pretty-hydra-define  hydra-window-menu (:foreign-keys warn :title "Window" :quit-key "q")
  (
   "Adjust"
   (
    ("<up>" enlarge-window "Up")
    ("<down>" shrink-window "Down")
    ("<left>" shrink-window-horizontally "Left")
    ("<right>" enlarge-window-horizontally "Right")
    ("=" balance-windows "Balance")
    )
   "Split"
   (("v" split-window-below "vsplit")
    ("h" split-window-right "hsplit"))
   "Delete"
   (("d" delete-window "Delete window")
    ("o" delete-other-windows "Delte other window"))
   "Switch Window"
   (("a" ace-window "ace-window"))
))

(global-set-key (kbd "C-x 0") 'hydra-window-menu/body)
(add-to-list 'load-path "~/.emacs.d/lib/")

;; my buffer
(defhydra hydra-buffer-menu (:color red
                             :hint nil)
"
"
("i" ibuffer "ibuffer")
("l" helm-buffers-list "list buffers")
("n" next-buffer "Next Buffer")
("p" previous-buffer "Previous Buffer")
("q" nil "Cancel" :color blue)
  )

(global-set-key (kbd "C-x C-b") 'hydra-buffer-menu/body)

;; my search
(defhydra hydra-search-menu (:color red
                             :hint nil)
"
"
("s" helm-occur "helm-occur")
("a" helm-ag "helm ag")
("i" imenu "imenu")
("r" query-replace "Query Replace")
("e" query-replace-regexp "Query Expression Replace")
("e" query-replace-regexp "Query Expression Replace")("q" nil "Cancel" :color blue)
  )

(global-set-key (kbd "C-c C-s") 'hydra-search-menu/body)

;; my File
(pretty-hydra-define  hydra-file-menu (:foreign-keys warn :title "File" :quit-key "q")
  ("Helm"
   (("f" helm-find-files "Helm Find File")
    ("a" helm-multi-files "Buffer-Recentf-Directory"))
   "Recentf"
   (("r" recentf-open-files "Recentf"))
   "Projectil"
   (("p" projectile-find-file "Projectil Find File"))))



;;("q" nil "Cancel" :color blue)

(global-set-key (kbd "C-c C-f") 'hydra-file-menu/body)



(provide 'hydra-config)
