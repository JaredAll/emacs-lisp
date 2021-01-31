(defvar relative-compile-command)

(defun make()
  (interactive)
  (setq compile-command relative-compile-command)
  (execute-kbd-macro (kbd "M-x compile")))

(defun clean()
  (interactive)
  (setq compile-command (concat relative-compile-command " clean"))
  (execute-kbd-macro (kbd "M-x compile")))

(defvar run-command)
(defun run()
  (interactive)
  (start-process "run" "run" run-command)
  (switch-to-buffer "run"))

(defvar test-command)
(defun test()
  (interactive)
  (setq compile-command test-command)
  (execute-kbd-macro (kbd "M-x compile")))

(defvar pdf-location)
(defun open-fresh-pdf()
  (interactive)
  (switch-to-buffer-other-window
   (find-file-noselect pdf-location t))
  (revert-buffer t t t))

(defun compile-and-display()
  (interactive)
  (save-selected-window
    (make)
    (sit-for 5)
    (open-fresh-pdf)))

(put 'run-command 'safe-local-variable
     (lambda (x) t))
(put 'relative-compile-command 'safe-local-variable
     (lambda (x) t))
(put 'test-command 'safe-local-variable
     (lambda (x) t))
(put 'pdf-location 'safe-local-variable
     (lambda (x) t))
