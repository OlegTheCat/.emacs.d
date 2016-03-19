(provide 'init-js)

(require-package 'js2-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)

(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)
