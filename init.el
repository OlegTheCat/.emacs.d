(let ((default-directory user-emacs-directory))
  (normal-top-level-add-subdirs-to-load-path))

(require 'init-packages)

(defun find-dot-emacs ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (find-file "~/.emacs.d/init.el"))

(defun find-init-clojure ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (find-file "~/.emacs.d/inits/init-clojure.el"))

(defun source-dot-emacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun cddev ()
  (interactive)
  (let ((devel-dir (getenv "DEVEL_DIR")))
    (cd (or devel-dir
            "~/devel"))))

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
(global-set-key (kbd "C-c e c") 'find-init-clojure)
(global-set-key (kbd "C-c e s") 'source-dot-emacs)

(global-set-key (kbd "C-+") 'enlarge-window)
(global-set-key (kbd "C-_") 'shrink-window)
(global-set-key (kbd "C->") 'enlarge-window-horizontally)
(global-set-key (kbd "C-<") 'shrink-window-horizontally)

(require-package 'yasnippet)
(require-package 'highlight-symbol)

(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(modify-syntax-entry ?- "w" emacs-lisp-mode-syntax-table)

(package-install-if-not-present 'markdown-mode)
(package-install-if-not-present 'magit)

(require-package 'aggressive-indent)
(require-package 'hydra)
(require-package 'string-edit)
(require-package 'flycheck)
(require-package 'flycheck-pos-tip)

(require-package 'projectile)
(require-package 'perspective)
(persp-mode)
(require 'persp-projectile)

(defun projectile-manually-add-known-project (project-root)
  (interactive "D")
  (projectile-add-known-project project-root))

(require-package 'coffee-mode)
(setq coffee-tab-width 2)

(require 'init-appearance)
(require 'init-defaults)
(require 'init-prog)
(require 'init-auto-complete)
(require 'init-company)
(require 'init-clojure)
(require 'init-common-lisp)
(require 'init-paredit)
(require 'init-c)
(require 'init-org)
(require 'init-ido)
(require 'init-haskell)
(require 'init-elixir)
(require 'init-html)

(load custom-file 'noerror)

(provide 'init)
