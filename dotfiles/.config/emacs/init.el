(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package lsp-mode
  :straight t)

(use-package go-mode
  :straight t
  :mode "\\.go\\'")

(use-package evil
  :straight t
  :hook (after-init . evil-mode))

(use-package org
  :straight t
  :demand t
  :config 
  (setq org-directory "~/org"
	org-default-notes-file "~/org/notes.org"
	org-agenda-files '("~/org" "~/org/dailies" "~/org/1x1")
	org-agenda-include-diary t))

(use-package which-key
  :straight t
  :config (which-key-mode))

(setq tab-width 2)

