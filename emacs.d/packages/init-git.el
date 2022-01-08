;;; init-git.el --- Git SCM -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; ========= git customizations ==========
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)


(provide 'init-git)
;;; init-git.el ends here
