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

(put 'run-command 'safe-local-variable
     (lambda (x) t))
(put 'relative-compile-command 'safe-local-variable
     (lambda (x) t))
