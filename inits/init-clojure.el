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

(require-package 'clojure-snippets)

(require-package 'cider)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(add-hook 'cider-repl-mode-hook #'projectile-mode)

(setq cider-show-error-buffer t)
(setq nrepl-log-messages t)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(modify-syntax-entry ?- "w" clojure-mode-syntax-table)
(modify-syntax-entry ?* "w" clojure-mode-syntax-table)
(modify-syntax-entry ?! "w" clojure-mode-syntax-table)
(modify-syntax-entry ?? "w" clojure-mode-syntax-table)
(modify-syntax-entry ?: "w" clojure-mode-syntax-table)
(modify-syntax-entry ?> "w" clojure-mode-syntax-table)
(modify-syntax-entry ?< "w" clojure-mode-syntax-table)

(require-package 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               (cljr-add-keybindings-with-prefix "C-c C-m")))

(setq cljr-magic-requires :prompt)

(define-key clojure-mode-map (kbd "C-;") 'cljr-cycle-coll)

;; (require-package 'flycheck-clojure)
;; (eval-after-load 'flycheck '(flycheck-clojure-setup))
;; (setq flycheck-disabled-checkers (list 'clojure-cider-typed
;;                                        'clojure-cider-kibit))

;; (add-hook 'cider-mode-hook #'flycheck-mode)

;; (eval-after-load 'flycheck
;;   '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

(setq nrepl-hide-special-buffers t)
(setq nrepl-log-messages nil)

(setq cider-repl-use-pretty-printing t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")

(put-clojure-indent 'match 'defun)
(put-clojure-indent 'let-flow 'defun)

;; Disabled due to heavy lag
;; (add-hook 'clojure-mode-hook 'aggressive-indent-mode)

(setq cider-cljs-repl "(do (require 'figwheel-sidecar.repl-api)
                           (figwheel-sidecar.repl-api/start-figwheel!)
                           (figwheel-sidecar.repl-api/cljs-repl))")

;; manual starting cljs repl from nrepl session
(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert cider-cljs-repl)
    (cider-repl-return)))

(defun cider-clear-output-all-repls ()
  (interactive)
  (let ((origin-buffer (current-buffer))
        (connections (cider-connections)))
    (mapc
     (lambda (connection)
       (switch-to-buffer connection)
       (cider-repl-clear-buffer))
     connections)
    (switch-to-buffer origin-buffer)))

(global-set-key (kbd "C-c M-o") #'cider-clear-output-all-repls)

(global-set-key (kbd "C-c f r") #'cider-figwheel-repl)

(provide 'init-clojure)
