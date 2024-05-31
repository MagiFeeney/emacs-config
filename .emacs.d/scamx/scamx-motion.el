
(defun meow-motion-exit ()
  "Switch to NORMAL state."
  (interactive)
  (cond
   ((meow-keypad-mode-p)
    (meow--exit-keypad-state))
   ((and (meow-motion-mode-p)
         (eq meow--beacon-defining-kbd-macro 'quick))
    (setq meow--beacon-defining-kbd-macro nil)
    (meow-beacon-motion-exit))
   ((meow-motion-mode-p)
    (when overwrite-mode
      (overwrite-mode -1))
    (meow--switch-state 'normal))))

(defun meow-motion ()
  "Move to the start of selection, switch to INSERT state."
  (interactive)
  (if meow--temp-normal
      (progn
        (message "Quit temporary normal mode")
        (meow--switch-state 'motion))
    (meow--switch-state 'motion)))

;; (defun scamx-motion-latex-mode ()
;;   (meow-motion-overwrite-define-key
;;    '("g" . meow-motion-exit)
;;    '("h" . LaTeX-mark-environment)
;;    '("=" . LaTeX-mark-section)
;;    '("n" . LaTeX-find-matching-end)
;;    '("p" . LaTeX-find-matching-begin)
;;    '("e" . LaTeX-environment)
;;    '("s" . LaTeX-section)
;;    '("[" . reftex-citation)
;;    '("]" . LaTeX-close-environment)
;;    '("(" . reftex-label)
;;    '(")" . reftex-reference)
;;    '("f" . TeX-font)
;;    ))

;; (defun scamx-motion-org-mode ()
;;   (meow-motion-overwrite-define-key
;;    '("g" . meow-motion-exit)   
;;    '("h" . backward-delete-char)
;;    '("p" . previous-line)
;;    ))

(provide 'scamx-motion)
