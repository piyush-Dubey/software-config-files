;;; package --- Summary:
;;; Commentary:
;; -*- emacs-lisp -*-

;;; Code:
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init)
;;; init.el ends here
