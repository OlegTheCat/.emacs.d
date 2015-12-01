(require-package 'company)
(require-package 'company-quickhelp)

(global-set-key (kbd "C-x C-o") 'company-complete)

(setq company-idle-delay nil)

(setq company-tooltip-limit 20)
(setq company-tooltip-align-annotations t)
(setq-default company-quickhelp-delay nil)

(provide 'init-company)
