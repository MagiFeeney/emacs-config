;; require packages from melpa
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")))

;; mc
(use-package multiple-cursors
  :ensure t
  :bind (("C-'" . mc/edit-lines) ;; region lines add cursors
	 ;; add cursor by line	 
         ("C-," . mc/mark-previous-like-this)
         ("C-." . mc/mark-next-like-this)
	 ;; skip line	 
         ("C-<" . mc/skip-to-previous-like-this)
         ("C->" . mc/skip-to-next-like-this)
	 ;; dwim	 
         ("C-;" . mc/mark-all-dwim)
         ("C-:" . mc/mark-all-like-this)
	 ;; insert	 
         ("M-s 0" . mc/insert-numbers)
         ("M-s 1" . mc/insert-letters)
	 ;; mark all in the region	 
         ("M-s a" . mc/mark-all-in-region)
         ("M-s w" . mc/mark-all-words-like-this))
  :config
  (setq mc/always-run-for-all t))

;; avy
(use-package avy
  :bind
  (("C-x j ;" . avy-resume)
   ("C-x j j" . avy-goto-char)
   ("C-x j l" . avy-goto-char-2)
   ("C-x j g" . avy-goto-line)
   ("C-x j c" . avy-copy-line)
   ("C-x j w" . avy-goto-word-1)
   ("C-x j e" . avy-goto-word-0)))

;; global org directory
(setq org-directory (file-truename "~/Documents/Brain"))
(use-package org
  :ensure t
  :custom
  (org-agenda-files (concat org-directory "/agenda.org"))
  (org-default-notes-file (concat org-directory "/Capture"))
  (org-capture-templates
   '(("t" "TODO" entry (file+headline "~/Documents/Brain/Capture/notes.org" "Tasks")
      "* TODO %?\n  %i\n  %a")
     ("j" "Journal" entry (file+datetree "~/Documents/Brain/Capture/journal.org")
      "* %?\nEntered on %U\n  %i\n  %a")))
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :config
  (define-key org-mode-map (kbd "C-,") nil))

;; org-roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (concat org-directory "/Roam"))
  :bind (("C-x n l" . org-roam-buffer-toggle)
         ("C-x n f" . org-roam-node-find)
         ("C-x n i" . org-roam-node-insert)
         ("C-x n c" . org-roam-capture)
         ;; Dailies
         ("C-x n j" . org-roam-dailies-capture-today)
         ("C-x n ," . org-roam-dailies-goto-yesterday)
	 ("C-x n ." . org-roam-dailies-goto-today)
         ("C-x n /" . org-roam-dailies-goto-tomorrow)
         ("C-x n ;" . org-roam-dailies-goto-previous-note)
         ("C-x n '" . org-roam-dailies-goto-next-note))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

;; LaTeX
(use-package tex
  :ensure auctex
  :custom
  (TeX-view-program-selection '(output-pdf "PDF Tools"))
  (TeX-source-correlate-start-server t)
  (TeX-electric-math '("$" . "$"))
  (blink-matching-paren nil)
  (LaTeX-electric-left-right-brace t)
  (TeX-electric-sub-and-superscript t)
  (TeX-parse-self t)
  (TeX-auto-save t)
  (reftex-plug-into-AUCTeX t)
  :config
  (add-hook 'TeX-after-compilation-finished-functions
	    #'TeX-revert-document-buffer)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
  (electric-pair-mode))

;; template
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; C++ compile
(global-set-key (kbd "C-c C-v") 'compile)
(global-set-key (kbd "C-c C-m") 'recompile)

;; expand region
;; (require 'expand-region)
;; (global-set-key (kbd "C-=") 'er/expand-region)
;; (global-set-key (kbd "C-c i") 'er/mark-inside-pairs)
;; (global-set-key (kbd "C-c o") 'er/mark-outside-pairs)
