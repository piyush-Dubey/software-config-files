;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; ========= lsp server Python ==========
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook #'lsp) ; or lsp-deferred

;; To set path of python executable, look at https://emacs-lsp.github.io/lsp-python-ms/#faq
(setq lsp-python-ms-executable "~/venv/bin/pylsp")


(provide 'init-python)
;;; init-python.el ends here
