(require 'ido)

(ido-mode 1)
(ido-everywhere 1)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold t
      ido-use-filename-at-point nil
      ido-max-prospects 10)

(require-package 'smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require-package 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

(require-package 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require-package 'flx-ido)
(flx-ido-mode 1)
(setq ido-use-faces nil)

(provide 'init-ido)
