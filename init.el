
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("12dd37432bb454355047c967db886769a6c60e638839405dad603176e2da366b" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (company flymake-cppcheck eglot ccls gnu-elpa-keyring-update lsp-mode alect-themes multiple-cursors))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Tlwg Mono" :foundry "PfEd" :slant normal :weight normal :height 113 :width normal)))))

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(setq c-default-style "bsd")
(setq c-basic-offset 2)
(setq-default indent-tabs-mode nil)

;;multiple cursors and keybinding
(require 'multiple-cursors)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;;set themes
(setq package-enable-at-startup nil)
(package-initialize)
(load-theme 'dakrone t)
;;(load-theme 'alect-light t)

;;melpa repository for packages
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;;(global-auto-complete-mode t)

(load-file "~/.emacs.d/format.el")

(load-file "~/emacs-lisp/new_function_brackets.el")
(load-file "~/.emacs.d/welcome-screen.el")
(load-file "~/.emacs.d/emacs-lisp/relative-compile.el")

;;make compile command work with bash aliases
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;;specify directory for backups
(setq backup-directory-alist `(("." . "~/.saves")))

;;indexing
(require 'xcscope)

;;company mode
(add-hook 'after-init-hook 'global-company-mode)

;;custom keybindings
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-S-i") 'cscope-find-this-symbol)
(global-set-key (kbd "<S-return>") 'add-function-brackets)
(global-set-key (kbd "C-S-<f10>") 'make)
(global-set-key (kbd "C-S-<f11>") 'clean)
(global-set-key (kbd "S-<f11>") 'test)
(global-set-key (kbd "S-<f10>") 'run)
(global-set-key (kbd "M-c") 'compile)
(global-set-key (kbd "M-i") 'eglot-find-declaration)
(global-set-key (kbd "M-e") 'flymake-goto-next-error)
(global-set-key (kbd "M-j") 'dired)
(global-set-key (kbd "TAB") 'indent-for-tab-command)
(global-set-key (kbd "<M-return>") 'eglot-code-actions)

(add-hook 'Info-mode-hook
          (lambda ()
            (message "setting up info-mode")
            (define-key Info-mode-map (kbd "M-n") nil)
            )
          )

(put 'narrow-to-region 'disabled nil)
(create-personal-welcome-buffer)
