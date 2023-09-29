;; my ace window
(defhydra hydra-window-menu (:color red
                             :hint nil)
""
("a" ace-window "ace-window")
("v" split-window-below "vsplit")
("h" split-window-right "hsplit")
("d" delete-window "Delete window")
("o" delete-other-windows "Delte other window")
("q" nil "Cancel" :color blue)
  )

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

(global-set-key (kbd "C-x b") 'hydra-buffer-menu/body)


(provide 'hydra-config)
