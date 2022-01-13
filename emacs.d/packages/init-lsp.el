;;; init-lsp.el --- Language Server Protocol -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; ========== lsp server =========
(use-package lsp-mode
  :commands lsp-mode
  :hook
  (scala-mode . lsp)
  ;; (lsp-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  :custom
;;  (lsp-eldoc-render-all t)
  (gc-cons-threshold 100000000) ;; 100mb
  (read-process-output-max (* 1024 1024)) ;; 1mb
  (lsp-idle-delay 0.500)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-completion-provider :capf)
;;  (lsp-prefer-flymake nil)
  )


(use-package lsp-ui
  :ensure
  :custom
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-delay 2)
  (lsp-ui-doc-delay 2))

(provide 'init-lsp)
;;; init-lsp.el ends here
