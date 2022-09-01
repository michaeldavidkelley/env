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

(use-package lsp-ui
  :straight t
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-header t
        lsp-ui-doc-include-signature t
        lsp-ui-doc-max-width 80
        lsp-ui-doc-max-height 20
        lsp-ui-doc-use-childframe nil))

(use-package protobuf-mode
  :straight t)

(use-package go-mode
  :straight t
  :after (lsp-mode)
  :mode "\\.go\\'"
  :hook (go-mode . (lambda ()
                   (setq-local compile-command "go build -v && go test -race -cover -v && go vet")
                   (setq-local compilation-read-command nil)
                   (setq-local tab-width 2)
                   (setq-local lsp-gopls-build-flags ["-tags=integration,sandbox"])
                   (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\vendor\\'")
                   (add-hook 'before-save-hook #'lsp-format-buffer nil t)
                   (add-hook 'before-save-hook #'lsp-organize-imports nil t))))

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

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(setq tab-width 2)

