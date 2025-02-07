;;;###autoload
(defun LaTeX-forward-environment (&optional N do-push-mark)
  "Move to the \\end of the next \\begin, 
or to the \\end of the current environment
(whichever comes first) N times.

Never goes into deeper environments.

DO-PUSH-MARK defaults to t when interactive,
but mark is only pushed if region isn't active."
  (interactive "p")
  (unless (region-active-p)
    (when do-push-mark (push-mark)))
  (let ((start (point))
	(count (abs N))
	(direction (if (< N 0) -1 1)))
    (while (and (> count 0)
		(re-search-forward "\\\\\\(begin\\|end\\)\\b"
				   nil t direction))
      (cl-decf count)
      (if (or (and (> direction 0) (looking-back "begin" (- (point) 7)))
	      (looking-at "\\\\end"))
	  (unless (funcall (if (> direction 0)
			       #'LaTeX-find-matching-end
			     #'LaTeX-find-matching-begin))
	    (error "Unmatched \\begin?"))
	(when (looking-at "\\[") (forward-sexp 1))
	(when (looking-at "{") (forward-sexp 1))))))

;;;###autoload
(defun LaTeX-backward-environment (&optional N do-push-mark)
  "Move to the \\begin of the next \\end,
or to the \\begin of the current environment
(whichever comes first) N times.

Never goes into deeper environments.

DO-PUSH-MARK defaults to t when interactive,
but mark is only pushed if region isn't active."
  (interactive "p")
  (LaTeX-forward-environment (- N) do-push-mark))
