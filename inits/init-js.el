(provide 'init-js)

(require-package 'json-mode)
(require-package 'js2-mode)
(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)
