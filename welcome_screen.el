(defun create-personal-welcome-buffer()
  (interactive)
  (set-buffer (get-buffer-create "welcome"))
  (insert "Welcome back, Jared.")
  (switch-to-buffer "welcome"))
