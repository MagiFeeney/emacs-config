(defvar do.refs/db-dirs '("~/Documents/Brain/Refs/db-dirs")
  "A list of paths to directories containing all my bibtex databases")

(defvar do.refs/pdf-dir nil
  "The path to the directory containing the PDF files. The file
  for the entry with key <key> is stored as <key>.pdf.")

(defvar do.refs/notes-dir nil
  "The path to the directory containing my notes for the
  references. The note for the item with key <key> is stored in
  this folder as <key>.org")

(defvar do.refs/pdf-download-dir nil
  "The path to the temporary directory to which we download PDF
  files.")

(defun do.minimal.rg/get-window-height ()
  "Get a minimal window height for ivy."
  (max 10 (min (frame-height) 30)))  ; Adjust these numbers as needed

(defvar do.minimal/pdf-reader "evince"
  "Default PDF reader to use if no guess is found.")

(defun do.refs/get-db-file-list ()
  "Get the list of all the bib files containing my bib database."
  (mapcan (lambda (dir) (directory-files dir t "\\.bib\\'"))
          do.refs/db-dirs))

(defun do.refs/update-db-file-list ()
  "Update the list of bib files."
  (interactive)
  (let ((db-list (do.refs/get-db-file-list)))
    (setq reftex-default-bibliography db-list)
    (setq bibtex-completion-bibliography db-list)
    (setq ebib-preload-bib-files db-list)))

(use-package ebib
  :ensure t
  :config
  ;; point it to our database
  (setq ebib-file-search-dirs `(,do.refs/pdf-dir))
  (setq ebib-notes-directory do.refs/notes-dir)
  (setq ebib-preload-bib-files (do.refs/get-db-file-list))

  ;; `ebib' uses `bibtex.el' to auto-generate keys for us
  (setq bibtex-autokey-year-length 4)
  (setq bibtex-autokey-titleword-separator "-")
  (setq bibtex-autokey-name-year-separator "-")
  (setq bibtex-autokey-year-title-separator "-")
  (setq bibtex-autokey-titleword-length 8)
  (setq bibtex-autokey-titlewords 3)
  (setq bibtex-autokey-titleword-ignore ;; I took "On" out of this
        '("A" "An" "The" "Eine?" "Der" "Die" "Das" "[^[:upper:]].*" ".*[^[:upper:][:lower:]0-9].*"))

  ;; make ebib window easier to deal with
  (setq ebib-index-window-size 25)

  ;; use a common/similar notes template between `ebib' and `ivy-bibtex'.
  (setq ebib-notes-template "#+TITLE: Notes on: %T\n\n>|<")
  (remove-hook 'ebib-notes-new-note-hook #'org-narrow-to-subtree)

  ;; a small convenience function to import into ebib from the clipboard
  (defun do.refs/ebib-import-from-clipboard ()
    "Attempt to import the contents in the kill ring/clipboard into `ebib'."
    (interactive)
    (with-temp-buffer
      (yank)
      (ebib-import)
      (call-interactively #'ebib)))

  ;; another convenience function to add the most recently downloaded PDF file
  ;; from the ~/Downloads folder to the current entry
  (defun do.refs/ebib-add-newest-from-downloads (&optional file-extension)
    "Add the most recent file from `do.refs/pdf-download-dir' to the ebib entry at point."
    (interactive)
    ;; pull out the most recent file from ~/Downloads with the .pdf extension.
    (let ((newest-file (let ((dir-files (directory-files-and-attributes do.refs/pdf-download-dir)))
                         (caar (sort
                                (if (not file-extension)
                                    ;; the newest file from the download directory
                                    (mapcan (lambda (x)
                                              (let ((file-name (concat (file-name-as-directory do.refs/pdf-download-dir) (car x))))
                                                (when (file-regular-p file-name) (cons x nil))))
                                            dir-files)
                                  ;; all files with a certain extension
                                  (mapcan (lambda (x) (when (string-equal (file-name-extension (nth 0 x)) file-extension) (cons x nil)))
                                          dir-files))
                                ;; sort by date
                                (lambda (x y) (not (time-less-p (nth 6 x) (nth 6 y)))))))))
      (if newest-file
          ;; https://nullprogram.com/blog/2017/10/27/
          ;; need to override `read-file-name' because ebib normally prompts us for the file to import
          (let ((fpath (concat (file-name-as-directory do.refs/pdf-download-dir) newest-file))
                (bibkey (ebib--get-key-at-point)))
            (cl-letf (((symbol-function 'read-file-name) (lambda (&rest _) fpath)))
              (let ((current-prefix-arg '(4))) ;; C-u (to keep from removing original file)
                (call-interactively #'ebib-import-file)))
            (message "[Ebib] [Dennis] Imported %s for %s" fpath bibkey))
        (message "[Ebib] [Dennis] No files from %s imported." do.refs/pdf-download-dir))))

  ;; legacy
  (defun do.refs/ebib-add-newest-pdf-from-downloads ()
    "Add the most recently-downloaded PDF in the `do.refs/pdf-download-dir' directory to the current entry in ebib."
    (interactive)
    (do.refs/ebib-add-newest-from-downloads "pdf"))

  ;; on import, create two copies of the file. one for reading, one
  ;; for annotating. can also use this command to add an annotated
  ;; file to an existing entry
  (defun do.refs/ebib-add-annotated (arg)
    "Advice for `ebib-import-file' that automatically creates a
  copy of the imported file that will be used for annotation."
    (interactive "P")
    (let ((filename (ebib-get-field-value "file"
                                          (ebib--get-key-at-point)
                                          ebib--cur-db 'noerror 'unbraced)))
      (when filename
        (let* ((pdf-path (file-name-as-directory (car ebib-file-search-dirs)))
               (orig-path (concat pdf-path filename))
               (annot-path (concat pdf-path
                                   (file-name-sans-extension filename)
                                   "-annotated"
                                   (file-name-extension filename t))))
          (unless (file-writable-p annot-path)
            (error "[Ebib] [Dennis] Cannot write file %s" annot-path))
          (copy-file orig-path annot-path)))))

  ;; add the above after the original call is done.
  (unless (and (boundp 'do.refs/add-annotated) (not do.refs/add-annotated))
    (advice-add #'ebib-import-file :after #'do.refs/ebib-add-annotated)))

(use-package ivy-bibtex
  :ensure t
  :init
  (do.refs/update-db-file-list)
  (setq bibtex-completion-library-path `(,do.refs/pdf-dir))
  (setq bibtex-completion-notes-path do.refs/notes-dir) ; notes are by default <key>.org

  ;; need this extra config (see github page)
  (push '(ivy-bibtex . ivy--regex-ignore-order)
  ivy-re-builders-alist)

  ;; make sure we can open additional files through =M-x bib=
  (setq bibtex-completion-pdf-field nil)

  ;; could save an annotated version of a PDF with <key>-annotated.pdf
  (setq bibtex-completion-find-additional-pdfs t)

  ;; what is the default citation style?
  (setq bibtex-completion-cite-default-command "cite")
  (setq bibtex-completion-cite-default-as-initial-input t)

  ;; open PDFs with our favourite PDF reader
  (setq bibtex-completion-pdf-open-function
        (lambda (fpath)
          ;; use dired-guess-default for this, set the programs with dired-guess-shell-alist-user
          (let ((guess (dired-guess-default (list fpath))))
            (if guess
                (call-process (car guess) nil 0 nil fpath)
              (call-process do.minimal/pdf-reader nil 0 nil fpath))))))

(defun do.refs/custom-insert-reference (keys)
  "This is a hacked version of `bibtex-completion-insert-reference'.

I just remove some punctuation and whitespace compared to the
original. It's still not perfect, but works well enough for
something I won't need much"
(let* ((refs (--map (s-word-wrap fill-column (bibtex-completion-apa-format-reference it))
                keys)))
  (insert (s-join "\n" refs) "\n")))

(advice-add #'bibtex-completion-insert-reference :override #'do.refs/custom-insert-reference)

(use-package org-ref
  :ensure t
  :demand ; we demand this because it also displays citations in latex documents
  :init
  (setq org-ref-completion-library 'org-ref-ivy-cite)
  :config
  ;; edit notes using the bibtex-completion package, i.e. `ivy-bibtex'
  (setq org-ref-notes-function
        (lambda (thekey)
          (let ((bibtex-completion-bibliography (org-ref-find-bibliography)))
            (bibtex-completion-edit-notes
             (list (car (org-ref-get-bibtex-key-and-file thekey)))))))
  (defun do.refs/org-ref-insert (&optional arg)
    "Fix org-ref's cite command"
    ;; make sure bibtex-completion is initialized
    (bibtex-completion-init)
    ;; fix org-ref (see https://github.com/jkitchin/org-ref/issues/717#issuecomment-633788035)
    (ivy-set-display-transformer 'org-ref-ivy-insert-cite-link 'ivy-bibtex-display-transformer)
    ;; fix the height of the cite window
    (let ((ivy-fixed-height-minibuffer t))
      (push '(org-ref-ivy-insert-cite-link . do.minimal.rg/get-window-height) ivy-height-alist)
      (org-ref-insert-link arg)
      (pop ivy-height-alist))))

(use-package reftex
  :init
  (setq reftex-default-bibliography (do.refs/get-db-file-list))
  :config
  (require 'reftex-cite))

(defvar do.refs/default-bib-name "main.bib"
  "The default name for bibliographies generated from TeX or org files.")

(defvar do.refs/bib-file-post-process-function nil
  "A function to post-process the auto-generated .bib
  files. Called with a temporary buffer as single argument.")

(defun do.refs/mangle-bib-files (buffer)
  "Insert a header and pull some fields out of the bib file."
  (goto-char (point-min))
  (insert "% ------------------------------------------------------------------\n"
          (format-time-string
           "% -- This file was auto-generated on %Y-%m-%d at %T\n")
          "% -- Change at own risk.\n"
          "% ------------------------------------------------------------------\n\n")
  ;; let's just say that the month field in BibTeX is a little strange... This
  ;; is an attempt at removing the {braces} when we find one of the
  ;; three-letter month codes jan, feb, etc. in braces.
  (mapcar (lambda (month)
            (goto-char (point-min))
            (while (re-search-forward (format "\\(^\s+month\s+=\s+\\){%s}" month) nil t)
              (replace-match (format "\\1%s" month))))
          '("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec")))

(setq do.refs/bib-file-post-process-function #'do.refs/mangle-bib-files)

(defun do.refs/generate-bib-file (&optional outfile)
    "Generate a .bib file for the tex or org document in the current buffer.

  This is done by first extracting all citation keys from the
  document and then pulling them from the global database."
    (interactive
     ;; if called with a prefix arg, put the generated bib into the kill ring
     ;; instead of writing it to a file.
     (if current-prefix-arg
         (list 'copy)
       ;; prompt user, get outfile, make sure this all works out.
       (if (not (or (derived-mode-p 'tex-mode) (derived-mode-p 'org-mode)))
           (prog1 nil (message "Not visiting a TeX or org buffer."))
         (let ((target-file (read-file-name "Path to .bib file: " nil nil nil do.refs/default-bib-name)))
           (cond ((file-directory-p target-file) (error "Output cannot be a directory."))
                 ((file-exists-p target-file)
                  (if (yes-or-no-p (format "File %s exists. Overwrite? " target-file))
                      (list target-file)
                    (message "Not overwriting %s." target-file) nil))
                 (t (list target-file)))))))
    (when outfile
      ;; write the output file
      (let ((mode (cond ((derived-mode-p 'org-mode) 'org)
                        ((derived-mode-p 'tex-mode) 'tex))))
        (let ((tex-buffer (cond ((equal mode 'tex) (current-buffer))
                                ((equal mode 'org)
                                 ;; need to export the org doc to latex before we can scan
                                 (let ((org-export-show-temporary-export-buffer nil)
                                       (fn (file-name-sans-extension
                                            (buffer-file-name (current-buffer)))))
                                   (org-latex-export-to-latex)
                                   (find-file fn)))))
              (msg (format "Saving .bib file for %s to %s..."
                           (cond ((equal mode 'tex) (reftex-TeX-master-file))
                                 ((equal mode 'org) (buffer-file-name (current-buffer))))
                           outfile)))
          ;; extract all keys from file using reftex and insert into bib file using bibtex-completion
          (with-current-buffer tex-buffer
            (let ((keys (reftex-all-used-citation-keys))
                  ;; skip over some fields for bib file generation
                  (bibtex-completion-no-export-fields (append '("author+an" "keywords" "abstract" "file")
                                                              bibtex-completion-no-export-fields)))
              (with-temp-buffer
                (mapcar (lambda (key) (insert (concat (bibtex-completion-make-bibtex key) "\n"))) keys)
                (when (symbol-function do.refs/bib-file-post-process-function) ; post-process
                  (funcall do.refs/bib-file-post-process-function (current-buffer)))
                ;; either write to file or move to kill ring
                (if (equal outfile 'copy)
                    (progn (kill-region (point-min) (point-max))
                           (message "Copied references database to kill ring."))
                  (write-file outfile)))))
          (when (equal mode 'org) ; close the exported document
            (kill-buffer tex-buffer))))))

(defun do.refs/get-ivy-cite-key ()
  "Attempt to return a citation key as a string using `ivy-bibtex'."
  (with-temp-buffer
    (let ((bibtex-completion-cite-prompt-for-optional-arguments nil)
        (ivy-bibtex-default-action 'ivy-bibtex-insert-citation))
      (ivy-bibtex))
    (when (> (buffer-size) 0)
      (buffer-string))))

(defun do.refs/ivy-bibtex-insert-cite-key (&optional arg)
  "Attempt to insert a citation key into the current LaTeX buffer."
  (let ((bibtex-completion-cite-prompt-for-optional-arguments nil)
        (ivy-bibtex-default-action 'ivy-bibtex-insert-citation))
    (ivy-bibtex arg)))

(defun do.refs/ivy-bibtex-insert-reference (&optional arg)
  "Attempt to insert a full reference into the current buffer."
  (let ((ivy-bibtex-default-action 'ivy-bibtex-insert-reference))
    (ivy-bibtex arg)))

(defun do.refs/insert-key-or-reference (arg)
  "A DWIM 'cite' command."
  (interactive "P")
  (cond ((derived-mode-p 'org-mode) (do.refs/org-ref-insert arg))
        ((derived-mode-p 'tex-mode) (do.refs/ivy-bibtex-insert-cite-key arg))
        (t (do.refs/ivy-bibtex-insert-reference arg))))

(defun do.refs/call-ivy-bibtex (arg)
  "Use this to call `ivy-bibtex' with some interface customizations."
  (interactive "P")
  (let ((ivy-fixed-height-minibuffer t))
    (push '(ivy-bibtex . do.minimal.rg/get-window-height) ivy-height-alist)
    (ivy-bibtex arg)
    (pop ivy-height-alist)))

(defalias 'cite    #'do.refs/insert-key-or-reference)
(defalias 'bib     #'do.refs/call-ivy-bibtex)
(defalias 'gen-bib #'do.refs/generate-bib-file)
