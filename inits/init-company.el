(require-package 'company)
(require-package 'company-quickhelp)

(global-set-key (kbd "M-SPC") 'company-complete)

(setq company-idle-delay nil)

(setq company-tooltip-limit 20)
(setq company-tooltip-align-annotations t)
(setq-default company-quickhelp-delay nil)

(provide 'init-company)
