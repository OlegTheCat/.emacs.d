(require-package 'elixir-mode)
(require-package 'alchemist)

(add-hook 'alchemist-mode-hook 'company-mode)
(add-hook 'alchemist-iex-mode-hook 'company-mode)
(add-hook 'elixir-mode-hook
	  'electric-pair-mode)

(setq alchemist-test-status-modeline nil)

(provide 'init-elixir)
