;;; init-yasnippet.el --- Yasnippet -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; lsp-mode supports snippets, but in order for them to work we need to use yasnippet
;; If we don't want to use snippets set lsp-enable-snippet to nil in our lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
