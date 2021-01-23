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

(package-install 'flycheck)
(global-flycheck-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/projects/frequently-forgotten-parts/todo.org")))
 '(package-selected-packages
   (quote
    (rust-mode flycheck-rust htmlize flycheck-clang-tidy flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-hook 'after-init-hook #'global-flycheck-mode)

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)
;; Enable transient mark mode
(transient-mark-mode 1)
;;;;Org mode configuration
;; Enable Org mode
(require 'org)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
(global-set-key "\C-ca" 'org-agenda)
(provide 'init)
;;; init.el ends here
