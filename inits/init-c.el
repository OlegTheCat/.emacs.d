(setq c-basic-offset 4)
(setq c-default-style "java")

(add-hook 'c-mode-common-hook
	  'electric-pair-mode)

(add-hook 'c-mode-common-hook
	  'which-function-mode)

(add-hook 'c-mode-common-hook
	  (lambda () (interactive) (setq-local compilation-scroll-output t)))

(provide 'init-c)
