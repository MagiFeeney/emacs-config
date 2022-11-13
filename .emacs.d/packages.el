;; require packages from melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-v") 'compile)
(global-set-key (kbd "C-c C-m") 'recompile)

;; helm setting
(global-set-key (kbd "C-'") 'helm-find-files)
(global-set-key (kbd "C-;") 'helm-find)
(global-set-key (kbd "M-o") 'helm-M-x)

;; treemacs setting
(global-set-key (kbd "M-n") 'treemacs)
(setq-default dotspacemacs-configuration-layers '(
  (treemacs :variables treemacs-use-all-the-icons-theme t)))

;; org-roam setting
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Brain/"))
  :bind (("C-x n l" . org-roam-buffer-toggle)
         ("C-x n f" . org-roam-node-find)
         ("C-x n g" . org-roam-graph)
         ("C-x n i" . org-roam-node-insert)
         ("C-x n c" . org-roam-capture)
         ;; Dailies
         ("C-x n j" . org-roam-dailies-capture-today)
         ("C-x n ," . org-roam-dailies-goto-yesterday)
	 ("C-x n ." . org-roam-dailies-goto-today)
         ("C-x n /" . org-roam-dailies-goto-tomorrow))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(setq org-roam-graph-executable "dot")

;; ivy setting
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; pdf view
(pdf-tools-install)  ; Standard activation command

(define-key pdf-view-mode-map (kbd "]") 'pdf-view-scroll-up-or-next-page)
(define-key pdf-view-mode-map (kbd "[") 'pdf-view-scroll-down-or-previous-page)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
	  #'TeX-revert-document-buffer)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; auctex
(setq TeX-parse-self t)
(setq TeX-auto-save t)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; company
(global-company-mode)
