;;; package --- Summary:
;;; Commentary:
;; -*- emacs-lisp -*-

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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
    (pip-requirements rustic magit lsp-ui yasnippet lsp-metals sbt-mode use-package ein ## pyvenv posframe dap-mode company-irony htmlize flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(global-visual-line-mode)
(global-display-line-numbers-mode)


;; add .dir-locals.el file to any python directory with the following line
;; ((python-mode . ((lsp-python-ms-python-executable . "/.../bin/python"))))
(add-hook 'hack-local-variables-hook
      (lambda ()
    (when (derived-mode-p 'python-mode)
      (require 'lsp-python-ms)
      (lsp)))) ; or lsp-deferred


;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode))

(use-package company
  :bind (:map company-active-map
	      ("C-n" . company-select-next)
	      ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (global-company-mode t))

(add-to-list 'load-path "/home/pidubey/projects/software-config-files/emacs.d/packages/")

(require 'init-cpp)

(require 'init-org)
(require 'init-git)
(require 'init-python)

(require 'init-scala)

(provide 'init)
;;; init.el ends here
