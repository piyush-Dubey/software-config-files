;;; init-org.el --- Orgmode editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

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


(provide 'init-org)
;;; init-org.el ends here
