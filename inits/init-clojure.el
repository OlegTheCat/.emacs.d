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
(setq cider-repl-display-help-banner nil)
(setq nrepl-log-messages t)

(add-hook 'cider-mode-hook 'eldoc-mode)

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
(setq cljr-favor-prefix-notation nil)
(setq cljr-auto-clean-ns nil)

(define-key clojure-mode-map (kbd "C-;") 'cljr-cycle-coll)

(require-package 'flycheck-clojure)
(eval-after-load 'flycheck '(flycheck-clojure-setup))
(setq-default flycheck-disabled-checkers (list 'clojure-cider-typed
                                               'clojure-cider-kibit))

(add-hook 'cider-mode-hook #'flycheck-mode)

(setq nrepl-hide-special-buffers t)
(setq nrepl-log-messages nil)

(setq cider-repl-use-pretty-printing t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")

(put-clojure-indent 'match 'defun)
(put-clojure-indent 'let-flow 'defun)

;; Disabled due to heavy lag
;; (add-hook 'clojure-mode-hook 'aggressive-indent-mode)

(defun cider-eval (code)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert code)
    (cider-repl-return)))

;; manual starting cljs repl from nrepl session
(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (cider-eval "(do (require 'figwheel-sidecar.repl-api)
                   (figwheel-sidecar.repl-api/stop-figwheel!)
                   (figwheel-sidecar.repl-api/start-figwheel!)
                   (figwheel-sidecar.repl-api/cljs-repl))"))

(defun cider-cljs-quit ()
  (interactive)
  (save-some-buffers)
  (cider-eval ":cljs/quit"))

(defun cider-reloaded-reset ()
  (interactive)
  (cider-eval "(reloaded.repl/reset)"))

(defun cider-reloaded-go ()
  (interactive)
  (cider-eval "(reloaded.repl/go)"))

(defun cider-reloaded-stop ()
  (interactive)
  (cider-eval "(reloaded.repl/stop)"))

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
(global-set-key (kbd "C-c f q" ) #'cider-cljs-quit)

(global-set-key (kbd "C-c r r" ) #'cider-reloaded-reset)
(global-set-key (kbd "C-c r g" ) #'cider-reloaded-go)
(global-set-key (kbd "C-c r s" ) #'cider-reloaded-stop)

(require-package 'eval-in-repl)

(require 'eval-in-repl-cider)
(define-key clojure-mode-map (kbd "<C-return>") 'eir-eval-in-cider)


(provide 'init-clojure)
