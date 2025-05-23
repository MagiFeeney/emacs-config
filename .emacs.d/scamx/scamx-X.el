;; define a nested mode-setting map for scamx
(defvar-keymap scamx-set-mode-map
  :doc "set to a specific mode"
  "s" 'eshell
  "v" 'vterm
  "n" 'normal-mode
  "t" 'tex-mode
  "p" 'python-mode)

;; define scamx X map
(defvar scamx-X-keymap (make-sparse-keymap))
(defalias 'scamx-X-keymap scamx-X-keymap)
(define-key scamx-X-keymap (kbd "f") 'find-file)
(define-key scamx-X-keymap (kbd "s") 'save-buffer)
(define-key scamx-X-keymap (kbd "c") 'save-buffers-kill-terminal)
(define-key scamx-X-keymap (kbd "z") 'suspend-frame)
(define-key scamx-X-keymap (kbd "h") 'mark-whole-buffer)
(define-key scamx-X-keymap (kbd "<tab>") 'indent-rigidly)
(define-key scamx-X-keymap (kbd "(") 'kmacro-start-macro)
(define-key scamx-X-keymap (kbd ")") 'kmacro-end-macro)
(define-key scamx-X-keymap (kbd "e") 'kmacro-end-and-call-macro)
(define-key scamx-X-keymap (kbd "q") 'kbd-macro-query)
(define-key scamx-X-keymap (kbd "[") 'backward-page)
(define-key scamx-X-keymap (kbd "]") 'forward-page)
(define-key scamx-X-keymap (kbd "*") 'calc-dispatch)
(define-key scamx-X-keymap (kbd "b") 'consult-buffer)
(define-key scamx-X-keymap (kbd "l") 'buffer-menu)
(define-key scamx-X-keymap (kbd "k") 'kill-current-buffer)
(define-key scamx-X-keymap (kbd "j") 'dired-jump)
(define-key scamx-X-keymap (kbd "x") 'exchange-point-and-mark)
(define-key scamx-X-keymap (kbd "SPC") 'pop-to-mark-command)
(define-key scamx-X-keymap (kbd "n") 'duplicate-line)
(define-key scamx-X-keymap (kbd "<escape>") 'repeat-complex-command)
(define-key scamx-X-keymap (kbd ".") 'eval-last-sexp)
(define-key scamx-X-keymap (kbd ":") 'eval-expression)
(define-key scamx-X-keymap (kbd "=") 'text-scale-adjust)
(define-key scamx-X-keymap (kbd "v") 'magit-status)
(define-key scamx-X-keymap (kbd "o") scamx-org-map)
(define-key scamx-X-keymap (kbd "m") scamx-set-mode-map)
(define-key scamx-X-keymap (kbd "t") 'vterm)
;; customized
(define-key scamx-X-keymap (kbd "p") 'scamx-tramp-find-file)
(define-key scamx-X-keymap (kbd "\\") (lambda () (interactive) (kill-new buffer-file-name)))

(provide 'scamx-X)
