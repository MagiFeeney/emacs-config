;; require packages from melpa
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")))

;; mc
(use-package multiple-cursors
  :ensure t
  :defer t
  :config
  (setq mc/always-run-for-all t))

;; global org directory
(setq org-directory (file-truename "~/Documents/Brain"))
(use-package org
  :ensure t
  :defer t
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
  (add-hook 'org-mode-hook #'toggle-truncate-lines)
  ;; (add-hook 'LaTeX-mode-hook #'scamx-motion-org-mode)
  )

;; org-roam
(use-package org-roam
  :ensure t
  :defer t
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
         ("C-x n '" . org-roam-dailies-goto-next-note)
         ("C-x n r" . consult-org-roam-ripgrep))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode))

;; LaTeX
(use-package tex
  :ensure auctex
  :defer t
  :custom
  (TeX-view-program-selection '((output-pdf "PDF Tools")))
  (TeX-source-correlate-start-server t)
  (TeX-electric-math '("$" . "$"))
  (blink-matching-paren nil)
  (LaTeX-electric-left-right-brace t)
  (TeX-electric-sub-and-superscript t)
  (TeX-parse-self t)
  (TeX-auto-save t)
  (reftex-plug-into-AUCTeX t)
  ;; :hook
  ;; (LaTeX-mode . (lambda ()
  ;;                 (turn-on-reftex)
  ;;                 (LaTeX-math-mode)
  ;;                 (yas-minor-mode)
  ;;                 (pdf-tools-install)))
  ;; (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  :config
  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook #'yas-minor-mode)
  (add-hook 'LaTeX-mode-hook #'pdf-tools-install)
  ;; (add-hook 'LaTeX-mode-hook #'scamx-motion-latex-mode)
  (electric-pair-mode)
  (load-file "~/.emacs.d/academic/reference.el")) ; reference management

;; pdf tools
(use-package pdf-tools
  :ensure t
  :defer t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query))

;; template
(use-package yasnippet
  :ensure t  
  :defer t
  :config
  (yas-reload-all)  
  (add-hook 'prog-mode-hook #'yas-minor-mode))

(use-package expand-region
  :ensure t)

(use-package vterm
  :ensure t
  :defer t  
  :config
  (setq vterm-max-scrollback 100000
	vterm-timer-delay 0.01))
