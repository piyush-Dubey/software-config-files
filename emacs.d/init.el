;;; package --- Summary:
;;; Commentary:
;; -*- emacs-lisp -*-

;;; Code:

(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes nil)
 '(doc-view-continuous t)
 '(org-agenda-files (quote ("~/projects/frequently-forgotten-parts/todo.org")))
 '(package-selected-packages
   (quote
    (lsp-ui company pyvenv lsp-python-ms posframe dap-mode company-irony rust-mode flycheck-rust htmlize flycheck-clang-tidy flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'company)
(require 'rust-mode)
(load "~/projects/llvm-project/clang/tools/clang-format/clang-format.el")
(require 'clang-format)
(global-set-key [C-iso-lefttab] 'clang-format-region)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; (add-hook 'after-init-hook #'global-flycheck-mode)
(global-flycheck-mode)

(org-babel-do-load-languages
 'org-babel-load-languages '(
			     (C . t)
			     (shell . t)
			     (python . t)
			     (ditaa . t)
			     ))
(setq org-ditaa-jar-path "/usr/bin/ditaa")

;; Disable the splash screen (to enable it again, replace the t with 0)
(setq inhibit-splash-screen t)
;; Enable transient mark mode
(transient-mark-mode 1)
;;;;Org mode configuration
;; Enable Org mode


;; ========= org mode ==========
(require 'org)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
(global-set-key "\C-ca" 'org-agenda)


;; ========= lsp server lsp-python-ms ==========
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook #'lsp) ; or lsp-deferred

;; To set path of python executable, look at https://emacs-lsp.github.io/lsp-python-ms/#faq
(setq lsp-python-ms-executable "~/venv/bin/pyls")


;; ========= git customizations ==========
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(provide 'init)
;;; init.el ends here
