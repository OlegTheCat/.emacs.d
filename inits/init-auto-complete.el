(require-package 'auto-complete)
(global-auto-complete-mode)
(ac-linum-workaround)

(setq ac-auto-start nil)

(global-set-key (kbd "C-x C-o") 'auto-complete)
(global-set-key (kbd "M-n") 'ac-expand)
(global-set-key (kbd "M-p") 'ac-previous)

(provide 'init-auto-complete)
