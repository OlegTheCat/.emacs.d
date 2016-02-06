(setq custom-file "~/.emacs.d/custom.el")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

(setq scroll-preserve-screen-position t)

(setq undo-limit 2000000)

;; No more symbol count reports
(defun highlight-symbol-count (&rest args) nil)

(setq highlight-symbol-idle-delay 0.5)
(setq show-paren-style 'parenthesis)

(auto-compression-mode 1)

(setq-default indent-tabs-mode nil)

(global-auto-revert-mode 1)

;; Replace “yes or no” prompt with “y or n”
(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-x C-p") nil)

(require-package 'undo-tree)
(global-undo-tree-mode)

(provide 'init-defaults)
