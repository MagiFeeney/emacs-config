;; garbage collection
(setq gc-cons-percentage 0.2)
(setq gc-cons-threshold (* 200 1000 1000))
      (add-hook
       'after-init-hook
       (lambda () (setq gc-cons-threshold (* 20 1000 1000))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; (setq redisplay-dont-pause t
;;       scroll-margin 1
;;       scroll-step 1
;;       scroll-conservatively 10000
;;       scroll-preserve-screen-position 1)

(pixel-scroll-precision-mode)

(setq frame-title-format "Magi Feeney"
      inhibit-startup-screen t
      initial-scratch-message nil
      frame-inhibit-implied-resize t)

(defun display-startup-echo-area-message ()
  (message ""))

(defun ar/show-welcome-buffer ()
  "Show *Welcome* buffer."
  (with-current-buffer (get-buffer-create "*Welcome*")
    (setq truncate-lines t)
    (let* ((buffer-read-only)
           (image-path "~/.emacs.d/emacs.png")
           (image (create-image image-path))
           (size (image-size image))
           (height (cdr size))
           (width (car size))
           (top-margin (floor (/ (- (window-height) height) 2)))
           (left-margin (floor (/ (- (window-width) width) 2)))
           (title "Free as in Freedom"))
      (erase-buffer)
      (setq mode-line-format nil)
      (goto-char (point-min))
      (insert (make-string top-margin ?\n ))
      (insert (make-string left-margin ?\ ))
      (insert-image image)
      (insert "\n\n\n")
      (insert (make-string (floor (/ (- (window-width) (string-width title)) 2)) ?\ ))
      (insert (propertize title 'face `(:foreground "#9783b1" :background "#1E1826" :height 130))))
    (setq cursor-type nil)
    (read-only-mode +1)
    (switch-to-buffer (current-buffer))
    (local-set-key (kbd "q") 'kill-this-buffer)))


(when (< (length command-line-args) 2)
  (add-hook 'emacs-startup-hook (lambda ()
                                  (when (display-graphic-p)
                                    (ar/show-welcome-buffer)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(doom-feather-dark))
 '(custom-safe-themes
   '("1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "c865644bfc16c7a43e847828139b74d1117a6077a845d16e71da38c8413a5aaa" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "2853dd90f0d49439ebd582a8cbb82b9b3c2a02593483341b257f88add195ad76" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "a589c43f8dd8761075a2d6b8d069fc985660e731ae26f6eddef7068fece8a414" "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6" "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "9d1ce747e29d9e2e67452068ca8f5edb61ca726318b9020291d9361b10c4a4eb" "51b46522f63d434913daa17c5184405027013a0f92819eda2a575b6783ccb7bf" "2bcd3850ef2d18a4c9208fe3e2a78c95fb82f48c26661c86a51ea39152f3577e" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "4b287bfbd581ea819e5d7abe139db1fb5ba71ab945cec438c48722bea3ed6689" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "6f4421bf31387397f6710b6f6381c448d1a71944d9e9da4e0057b3fe5d6f2fad" "4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "2ce76d65a813fae8cfee5c207f46f2a256bac69dacbb096051a7a8651aa252b0" "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "74b9e99a8682c86659b8ace1610c4556c4619e6ca812a37b32d2c5f844fdafca" "22ce392ec78cd5e512169f8960edf5cbbad70e01d3ed0284ea62ab813d4ff250" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "4699e3a86b1863bbc695236036158d175a81f0f3ea504e2b7c71f8f7025e19e3" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "20a8ec387dde11cc0190032a9f838edcc647863c824eed9c8e80a4155f8c6037" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3" "f00a605fb19cb258ad7e0d99c007f226f24d767d01bf31f3828ce6688cbdeb22" "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "66bdbe1c7016edfa0db7efd03bb09f9ded573ed392722fb099f6ac6c6aefce32" "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "3319c893ff355a88b86ef630a74fad7f1211f006d54ce451aab91d35d018158f" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "e8567ee21a39c68dbf20e40d29a0f6c1c05681935a41e206f142ab83126153ca" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "f76b5717f04b34542972fb4d320df806d9a465f16c07b31b4bd6e79e4feb1794" default))
 '(delete-active-region t)
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
   '(symbol-overlay org-ref ivy-bibtex ebib vterm yasnippet-snippets consult marginalia orderless vertico corfu meow doom-modeline yasnippet ace-window pdf-tools use-package org-roam expand-region flycheck magit auctex doom-themes timu-spacegrey-theme which-key ess company multiple-cursors ##))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(send-mail-function 'mailclient-send-it)
 '(tool-bar-mode nil))

;; load custom files
(load-file "~/.emacs.d/theme.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/completion.el")
(load-file "~/.emacs.d/function.el")
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/kmacros.el")
(load-file "~/.emacs.d/email.el")

(use-package scamx
  :load-path "~/.emacs.d/scamx/"
  :config
  (electric-pair-mode)
  (delete-selection-mode))

;; Always use "y" for "yes"
(fset 'yes-or-no-p 'y-or-n-p)

;; c or c++ indentation
(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)

;; no autosave #file#
(setq make-backup-files nil)

;; retain last point for visited files when revisiting
(save-place-mode 1)

;; eww default url
(setq eww-search-prefix "http://frogfind.com//?q=")

;; proxy setting
;; (setenv "http_proxy" "http://127.0.0.1:7890/")
;; (setenv "https_proxy" "http://127.0.0.1:7890/")

;; only display line number to the programable file
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292A30" :foreground "#FFFFFF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 120 :width normal :foundry "JB" :family "JetBrains Mono"))))
 '(isearch ((t (:foreground "pink" :background "black" :weight bold :underline t))))
 '(lazy-highlight ((t (:foreground "#67B7A4" :background "#0d0d0d")))))
