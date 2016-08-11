(require-package 'company)
(require-package 'company-quickhelp)

(defun indent-or-complete ()
  (interactive)
  (if (looking-at "\\_>")
      (company-complete-common)
    (indent-according-to-mode)))

(global-set-key (kbd "M-SPC") 'company-complete)
(global-set-key (kbd "TAB") 'indent-or-complete)

(define-key company-active-map [tab]
  '(lambda ()
     (interactive)
     (company-complete-common-or-cycle 1)))
(define-key company-active-map [backtab]
  '(lambda ()
     (interactive)
     (company-complete-common-or-cycle -1)))

(setq company-idle-delay nil)
(setq company-tooltip-limit 20)
(setq company-tooltip-align-annotations t)
(setq-default company-quickhelp-delay nil)

(provide 'init-company)
