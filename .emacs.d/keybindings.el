;; meta key translation
;; (define-key key-translation-map (kbd "C-<return>") #'event-apply-meta-modifier)

(global-set-key (kbd "C-x <mouse-1>") 'previous-buffer)
(global-set-key (kbd "C-x <mouse-2>") 'copy-whole-buffer)
(global-set-key (kbd "C-x <mouse-3>") 'next-buffer)

;; mode shortcut
(global-set-key (kbd "C-c n") 'normal-mode)
(global-set-key (kbd "C-c p") 'python-mode)
(global-set-key (kbd "C-c t") 'tex-mode)
(global-set-key (kbd "C-c s") 'eshell)
