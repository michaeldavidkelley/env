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

(use-package protobuf-mode
  :straight t)

(use-package go-mode
  :straight t
  ;; :after (lsp-mode)
  :mode "\\.go\\'"
  :hook (go-mode . (lambda ()
                   (setq-local compile-command "go build -v && go test -race -cover -v && go vet")
                   (setq-local compilation-read-command nil)
                   (setq-local tab-width 2))))

(use-package vertico
  :straight t)

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

(setq tab-width 2)
