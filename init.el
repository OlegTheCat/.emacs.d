(let ((default-directory user-emacs-directory))
  (normal-top-level-add-subdirs-to-load-path))

(setq custom-file "~/.emacs.d/custom.el")

(require 'init-packages)

(defun find-dot-emacs ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (find-file "~/.emacs.d/init.el"))

(defun source-dot-emacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun cddev ()
  (interactive)
  (cd "/media/files/Oleg/devel/"))

(defun cds ()
  (interactive)
  (cd "/media/files/Oleg/Studies/"))

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

(global-set-key (kbd "C-c e o") 'find-dot-emacs)
(global-set-key (kbd "C-c e s") 'source-dot-emacs)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(global-set-key (kbd "C-c r e") (lambda ()
                                  (interactive)
                                  (revert-buffer nil t)))

(require-package 'undo-tree)
(global-undo-tree-mode)

(global-set-key (kbd "C-+") 'enlarge-window)
(global-set-key (kbd "C-_") 'shrink-window)
(global-set-key (kbd "C->") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<") 'shrink-window-horizontally)

(global-set-key (kbd "C-c w f") 'windmove-right)
(global-set-key (kbd "C-c w b") 'windmove-left)
(global-set-key (kbd "C-c w p") 'windmove-up)
(global-set-key (kbd "C-c w n") 'windmove-down)


(setq scroll-preserve-screen-position t)

;; TODO
;; (global-set-key (kbd "C-v")
;;  (lambda () (interactive (next-line (/ (window-height (selected-window)) 2)))))

;; (global-set-key (kbd "M-v")
;;  (lambda () (interactive (previous-line (/ (window-height (selected-window)) 2)))))


;; (defun window-half-height ()
;;   (max 1 (/ (1- (window-height (selected-window))) 2)))

;; (defun scroll-up-half ()
;;      (interactive)
;;      (scroll-up (window-half-height)))

;; (defun scroll-down-half ()
;;      (interactive)
;;      (scroll-down (window-half-height)))

;; (global-set-key (kbd "C-v") 'scroll-up-half)
;; (global-set-key (kbd "M-v") 'scroll-down-half)

(setq undo-limit 2000000)

(require-package 'yasnippet)
(require-package 'clojure-snippets)
(require-package 'highlight-symbol)

(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook (lambda () (interactive) (setq-local show-trailing-whitespace t)))
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'prog-mode-hook 'prettify-symbols-mode)
(add-hook 'prog-mode-hook 'line-number-mode)
(add-hook 'prog-mode-hook 'column-number-mode)

(setq highlight-symbol-idle-delay 0.5)
(setq show-paren-style 'parenthesis)

(global-set-key (kbd "C-x C-p") nil)
(global-visual-line-mode t)

(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(modify-syntax-entry ?- "w" emacs-lisp-mode-syntax-table)

(package-install-if-not-present 'ido-completing-read+)
(package-install-if-not-present 'magit)

(setq custom-theme-directory "~/.emacs.d/themes/")
(package-install-if-not-present 'gotham-theme)
(package-install-if-not-present 'solarized-theme)
(package-install-if-not-present 'zenburn-theme)
(setq theme-to-load 'solarized-light)

(setq-default indent-tabs-mode nil)

(require 'init-auto-complete)
(require 'init-company)
(require 'init-clojure)
(require 'init-common-lisp)
(require 'init-paredit)
(require 'init-c)
(require 'init-org)
(require 'init-ido)
(require 'init-iy-go-to-char)
(require 'init-haskell)

(load-theme theme-to-load t)

(load custom-file 'noerror)

(provide 'init)
