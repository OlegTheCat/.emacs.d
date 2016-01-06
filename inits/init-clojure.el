(require-package 'clojure-mode)

(define-clojure-indent
  (defroutes 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(require-package 'cider)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(setq cider-show-error-buffer nil)
(setq nrepl-log-messages t)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(require-package 'projectile)
(add-hook 'clojure-mode-hook 'projectile-mode)

(modify-syntax-entry ?- "w" clojure-mode-syntax-table)

(require-package 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))

(setq cljr-magic-requires :prompt)

;; (require-package 'flycheck-clojure)
;; (eval-after-load 'flycheck '(flycheck-clojure-setup))
;; (setq flycheck-disabled-checkers (list 'clojure-cider-typed
;;                                        'clojure-cider-kibit))

;; (add-hook 'cider-mode-hook #'flycheck-mode)

;; (eval-after-load 'flycheck
;;   '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

(setq nrepl-hide-special-buffers t)

(setq cider-repl-use-pretty-printing t)

(put-clojure-indent 'match 'defun)

(add-hook 'clojure-mode-hook 'aggressive-indent-mode)

(provide 'init-clojure)
