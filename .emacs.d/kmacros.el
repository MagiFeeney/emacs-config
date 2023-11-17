;; (fset 'task-kill
;;    (kmacro-lambda-form [?\M-h ?\C-n ?\C-\' ?\C-a ?k ?i ?l ?l ?  ?\M-d ?\M-f ?\C-k return ?\M-h ?\C-w] 0 "%d"))

;; (fset 'task-jctrl-kill
;;    (kmacro-lambda-form [?\M-h ?\C-n ?\C-\' ?\C-a ?j ?c ?t ?r ?l ?  ?k ?i ?l ?l ?  ?\M-f ?\C-k return ?\M-h ?\C-w] 0 "%d"))

(defalias 'task-kill
   (kmacro "M-h C-n C-' C-a k i l l SPC M-d M-f C-k <return> M-h C-w"))

(defalias 'task-jctrl-kill
   (kmacro "M-h C-n C-' C-a j c t r l SPC k i l l SPC M-f C-k <return> M-h C-w"))


(global-set-key (kbd "C-c x k") 'task-kill)
(global-set-key (kbd "C-c x j") 'task-jctrl-kill)

