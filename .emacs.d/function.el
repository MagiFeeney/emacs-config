(defun open-line-downward ()
  "Open a line downward (similar to `open-line' opening a line upward) and keep the cursor position."
  (interactive)
  (save-excursion
    (move-end-of-line 1)
    (newline-and-indent)))

(global-set-key (kbd "M-o") 'open-line-downward)

;; Quick copy
(defun copy-line-down (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

(defun copy-line-store()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
)

(global-set-key (kbd "C-x <down>") 'copy-line-down)
(global-set-key (kbd "C-x y") 'copy-line-store)


;; move line around
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key [(meta up)]  'move-line-up)
(global-set-key [(meta down)]  'move-line-down)

;; ;; add *todo* buffer
;; (condition-case err
;;     (let ((buffer (get-buffer-create "*todo*")))
;;       (with-current-buffer buffer
;;         (insert-file-contents "~/todo.org")
;;         (org-mode)))
;;   (error (message "%s" error-message-string err)))

;; create buffer
(defun create-buffer ()
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
  (switch-to-buffer (get-buffer-create bufname))
  (if (= n 1) initial-major-mode)))

;; git password
(defvar my-password-file "~/.emacs.d/password"
  "File path to store the password.")

(defvar my-password nil
  "Variable to store the password.")

(defun insert-password ()
  "Inserts the stored password at the current cursor position."
  (interactive)
  (if (not my-password)
      (progn
        (message "Password is null, please renew it.")
        (set-password t))
    (insert my-password)))

(global-set-key (kbd "C-c x p") #'insert-password)

(defun set-password (isRenew)
  "Interactively sets the value of the variable my-password.
If isRenew is non-nil, it indicates that my-password already has a value."
  (interactive "P")
  (if (not isRenew)
      (setq my-password (read-string "Enter password (overwrite): "))
    (setq my-password (read-string "Enter password (write): ")))
  (save-password))

(global-set-key (kbd "C-c x s") #'set-password)

(defun save-password ()
  "Saves the value of my-password to a file."
  (with-temp-file my-password-file
    (insert (or my-password ""))))

(defun load-password ()
  "Loads the value of my-password from the file."
  (when (file-exists-p my-password-file)
    (setq my-password (with-temp-buffer
                        (insert-file-contents my-password-file)
                        (buffer-string)))))

(load-password)

;; checkbox intermediate state
(defun toggle-checkbox ()
  "Toggles the state of the checkbox at the current cursor position."
  (interactive)
  (if (org-at-item-checkbox-p)
      (if (string= (match-string 0) "[-] ")
          (replace-match "[X]")
        (replace-match "[-] "))))

;; C-x h + M-w
(defun copy-whole-buffer ()
  "Copy the entire buffer to the kill ring."
  (interactive)
  (mark-whole-buffer)
  (kill-ring-save (point-min) (point-max)))

(defun bold-shrink-window-horizontally ()
  (interactive)
  (shrink-window-horizontally 40))

(defun bold-enlarge-window-horizontally ()
  (interactive)
  (enlarge-window-horizontally 40))
