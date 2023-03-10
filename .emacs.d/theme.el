;; custom face (bold, ubuntu mono)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292A30" :foreground "#FFFFFF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 128 :width normal :foundry "DAMA" :family "Ubuntu Mono")))))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-buffer-file-name-style 'relative-from-project
	doom-modeline-buffer-encoding nil
	doom-modeline-time-icon nil
	doom-modeline-buffer-state-icon nil
	doom-modeline-icon t))

(use-package all-the-icons
  :ensure t)
