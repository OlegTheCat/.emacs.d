;; Most of this was taken from here:
;; https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md

(require-package 'haskell-mode)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Ensure that happy, hacktags, stylish-haskell are 'cabal install'-ed

;; TODO
;; (eval-after-load 'haskell-mode
;;           '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(custom-set-variables '(haskell-tags-on-save t))

(provide 'init-haskell)
