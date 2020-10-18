(defun format-current-buffer()
  "format the code in the current buffer"
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-for-tab-command)
    (message "buffer formatted")))

(global-set-key (kbd "C-M-l") 'format-current-buffer)
