
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq frame-title-format "Magi Feeney")
(setq inhibit-startup-screen t)
(setq initial-scratch-message "Happy Hacking")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(doom-xcode))
 '(custom-safe-themes
   '("1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "6f4421bf31387397f6710b6f6381c448d1a71944d9e9da4e0057b3fe5d6f2fad" "4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "2ce76d65a813fae8cfee5c207f46f2a256bac69dacbb096051a7a8651aa252b0" "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "74b9e99a8682c86659b8ace1610c4556c4619e6ca812a37b32d2c5f844fdafca" "22ce392ec78cd5e512169f8960edf5cbbad70e01d3ed0284ea62ab813d4ff250" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "4699e3a86b1863bbc695236036158d175a81f0f3ea504e2b7c71f8f7025e19e3" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "20a8ec387dde11cc0190032a9f838edcc647863c824eed9c8e80a4155f8c6037" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3" "f00a605fb19cb258ad7e0d99c007f226f24d767d01bf31f3828ce6688cbdeb22" "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "66bdbe1c7016edfa0db7efd03bb09f9ded573ed392722fb099f6ac6c6aefce32" "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "3319c893ff355a88b86ef630a74fad7f1211f006d54ce451aab91d35d018158f" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "e8567ee21a39c68dbf20e40d29a0f6c1c05681935a41e206f142ab83126153ca" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "f76b5717f04b34542972fb4d320df806d9a465f16c07b31b4bd6e79e4feb1794" default))
 '(display-time-mode t)
 '(ensime-sem-high-faces
   '((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6")))
 '(font-use-system-font nil)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(package-selected-packages
   '(pdf-tools avy counsel swiper ivy use-package org-roam expand-region flycheck magit auctex doom-themes timu-spacegrey-theme kaolin-themes cyberpunk-theme which-key helm treemacs ess spacemacs-theme company auto-complete multiple-cursors ##))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(send-mail-function 'mailclient-send-it)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292A30" :foreground "#FFFFFF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 128 :width normal :foundry "DAMA" :family "Ubuntu Mono")))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c C-v") 'compile)
(global-set-key (kbd "C-c C-m") 'recompile)

(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)

(global-company-mode)

;; (condition-case err
;;   (when (get-buffer "*scratch*")
;;     (with-current-buffer "*scratch*"
;;       (erase-buffer)
;;       (insert-file-contents "~/todo.org")
;;       (org-mode)
;;     )
;;   )
;; (error (message "%s" error-message-string err)))

(condition-case err
    (let ((buffer (get-buffer-create "*todo*")))
      (with-current-buffer buffer
        (insert-file-contents "~/todo.org")
        (org-mode)))
  (error (message "%s" error-message-string err)))

;; (recentf-mode 1)

;; (setq history-length 10)
;; (savehist-mode 1)

(global-set-key [C-tab] 'other-window)

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

(global-set-key (kbd "C-c d") 'kill-whole-line)

(setq TeX-parse-self t)
(setq TeX-auto-save t)

(global-set-key (kbd "C-'") 'helm-find-files)
(global-set-key (kbd "C-;") 'helm-find)
(global-set-key (kbd "M-o") 'helm-M-x)

(global-set-key (kbd "M-n") 'treemacs)

(setq-default dotspacemacs-configuration-layers '(
  (treemacs :variables treemacs-use-all-the-icons-theme t)))

(setq make-backup-files nil)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

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

(pdf-tools-install)  ; Standard activation command

(define-key pdf-view-mode-map (kbd "]") 'pdf-view-scroll-up-or-next-page)
(define-key pdf-view-mode-map (kbd "[") 'pdf-view-scroll-down-or-previous-page)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
	  #'TeX-revert-document-buffer)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

; Custom keybindings
(global-set-key (kbd "C-<escape>") 'kill-buffer)

;; (global-flycheck-mode)
;(setq org-support-shift-select 'always)
