;; meta key translation
;; (define-key key-translation-map (kbd "C-<return>") #'event-apply-meta-modifier)

;; Custom keybindings
(global-set-key [C-tab] 'other-window)
(global-set-key (kbd "C-q") 'kill-buffer)
(global-set-key (kbd "C-c d") 'kill-whole-line)
(global-set-key (kbd "M-[") 'previous-buffer)
(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-\\") 'ivy-switch-buffer)
(global-set-key (kbd "C-|") 'delete-horizontal-space)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
;; (global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "M-{") 'scroll-up-line)
(global-set-key (kbd "M-}") 'scroll-down-line)
(global-set-key (kbd "C-x C-'") 'comment-or-uncomment-region)

(global-set-key (kbd "C-x p [") #'(lambda() (interactive) (shrink-window-horizontally 40)))
(global-set-key (kbd "C-x p ]") #'(lambda() (interactive) (enlarge-window-horizontally 40)))

(global-set-key (kbd "C-x x b") 'create-buffer)

;; mode shortcut
(global-set-key (kbd "C-c C-n") 'normal-mode)
(global-set-key (kbd "C-c C-p") 'python-mode)
(global-set-key (kbd "C-c e") 'evil-mode)
(global-set-key (kbd "C-c t") 'tex-mode)
(global-set-key (kbd "C-c s") 'eshell)
