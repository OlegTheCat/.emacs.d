(require-package 'anaconda-mode)
(require-package 'company-anaconda)
(require-package 'pyvenv)
(require-package 'pip-requirements)

;; (add-to-list 'company-backends 'company-anaconda)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'company-mode)

(define-key anaconda-mode-map (kbd "M-,") 'anaconda-mode-go-back)

(provide 'init-python)
