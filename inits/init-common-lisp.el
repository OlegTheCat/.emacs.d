(require-package 'slime)
(require-package 'ac-slime)

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))

(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime-autoloads)
(setq slime-contribs '(slime-fancy))
(slime-setup slime-contribs)

(modify-syntax-entry ?- "w" lisp-mode-syntax-table)

(add-hook 'slime-mode-hook 'aggressive-indent-mode)

(provide 'init-common-lisp)
