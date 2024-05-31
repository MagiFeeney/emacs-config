(defvar scamx-help-keymap (make-sparse-keymap))
(defalias 'scamx-help-keymap scamx-help-keymap)
(define-key scamx-help-keymap (kbd "k") 'meow-describe-key)
(define-key scamx-help-keymap (kbd "c") 'describe-key-briefly)
(define-key scamx-help-keymap (kbd "f") 'describe-function)
(define-key scamx-help-keymap (kbd "t") 'help-with-tutorial)
(define-key scamx-help-keymap (kbd "m") 'describe-mode)
(define-key scamx-help-keymap (kbd "e") 'view-echo-area-messages)
(define-key scamx-help-keymap (kbd "i") 'info)
(define-key scamx-help-keymap (kbd "d") 'view-emacs-debugging)
(define-key scamx-help-keymap (kbd "\\") 'describe-input-method)
(define-key scamx-help-keymap (kbd "b") 'describe-bindings)
(define-key scamx-help-keymap (kbd "p") 'describe-package)
(define-key scamx-help-keymap (kbd "r") 'info-display-manual)
(define-key scamx-help-keymap (kbd "s") 'apropos-command)
(define-key scamx-help-keymap (kbd "v") 'finder-by-keyword)
(define-key scamx-help-keymap (kbd "C-q") 'help-quick-toggle)
(define-key scamx-help-keymap (kbd "?") 'help-for-help)
(define-key scamx-help-keymap (kbd "q") 'help-quit)

(provide 'scamx-help)