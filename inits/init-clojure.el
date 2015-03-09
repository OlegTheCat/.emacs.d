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

(require 'cl)
(defun bk-kill-buffers (regexp)
  "Kill buffers matching REGEXP without asking for confirmation."
  (interactive "sKill buffers matching this regular expression: ")
  (flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
    (kill-matching-buffers regexp)))

(defun kill-cider-buffers ()
  (interactive)
  (bk-kill-buffers "cider")
  (bk-kill-buffers "nrepl*"))

(require-package 'cider)
(require-package 'auto-complete)
(require-package 'ac-cider)
(require-package 'clj-refactor)

(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(setq cider-show-error-buffer nil)
(setq nrepl-log-messages t)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(require-package 'projectile)
(add-hook 'clojure-mode-hook 'projectile-mode)

(modify-syntax-entry ?- "w" clojure-mode-syntax-table)

(provide 'init-clojure)
