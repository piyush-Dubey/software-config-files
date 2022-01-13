;;; init-cpp.el --- C, C++ editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :hook
  (c++-mode . lsp)
  (c-mode . lsp))

(setq clang-format-executable "/home/pidubey/projects/llvm-project/clang/tools/clang-format/clang-format.el")
;; (load "~/projects/llvm-project/clang/tools/clang-format/clang-format.el")
(require 'clang-format)
(global-set-key [C-iso-lefttab] 'clang-format-region)

(provide 'init-cpp)
;;; init-cpp.el ends here
