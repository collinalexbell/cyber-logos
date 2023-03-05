
(defun git (sub-command))

(defun subcommand->(sub-command)
  (inferior-shell:run (concatenate 'string sub-command (get-args))))
