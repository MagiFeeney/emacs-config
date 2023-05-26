(use-package evil
  :config
  (define-key evil-normal-state-map "I" nil)
  (define-key evil-normal-state-map "i" nil)
  (define-key evil-normal-state-map "J" nil)
  (define-key evil-normal-state-map "o" nil)
  (define-key evil-normal-state-map "O" nil)
  (define-key evil-normal-state-map "w" nil)
  (define-key evil-normal-state-map "W" nil)
  (define-key evil-normal-state-map "b" nil)
  (define-key evil-normal-state-map "B" nil)
  (define-key evil-normal-state-map "u" nil)
  (define-key evil-normal-state-map "t" nil)
  (define-key evil-visual-state-map "I" nil)
  (define-key evil-visual-state-map "i" nil) ; to rebind
  (define-key evil-visual-state-map "i" nil) ; to rebind
  (define-key evil-visual-state-map "i" nil) ; to rebind

  (define-key evil-motion-state-map "j" 'evil-backward-char)
  (define-key evil-motion-state-map "l" 'evil-forward-char)
  (define-key evil-motion-state-map "k" 'evil-next-line)
  (define-key evil-motion-state-map "i" 'evil-previous-line)

  (define-key evil-motion-state-map "J" 'evil-beginning-of-line)
  (define-key evil-motion-state-map "L" 'evil-end-of-line-or-visual-line)
  (define-key evil-motion-state-map "K" 'evil-forward-paragraph)
  (define-key evil-motion-state-map "I" 'evil-backward-paragraph)

  (define-key evil-normal-state-map "f" 'evil-insert)

  (define-key evil-normal-state-map ";" 'evil-open-below)
  (define-key evil-normal-state-map ":" 'evil-open-above)

  (define-key evil-normal-state-map "t" 'evil-undo)

  (define-key evil-normal-state-map "u" 'evil-backward-word-begin)
  (define-key evil-normal-state-map "U" 'evil-backward-WORD-begin)
  (define-key evil-normal-state-map "o" 'evil-forward-word-begin)
  (define-key evil-normal-state-map "O" 'evil-forward-WORD-begin)

  )
  ;; (setq evil-emacs-state-cursor    '("#649bce" box))
  ;; (setq evil-normal-state-cursor   '("#d9a871" box))
  ;; (setq evil-operator-state-cursor '("#ebcb8b" hollow))
  ;; (setq evil-visual-state-cursor   '("#677691" box))
  ;; (setq evil-insert-state-cursor   '("#eb998b" (bar . 2)))
  ;; (setq evil-replace-state-cursor  '("#eb998b" hbar))
  ;; (setq evil-motion-state-cursor   '("#ad8beb" box)))
    
