(setq is-mac (equal system-type 'darwin))

(global-visual-line-mode t)

(setq custom-theme-directory "~/.emacs.d/themes/")
(package-install-if-not-present 'gotham-theme)
(package-install-if-not-present 'solarized-theme)
(package-install-if-not-present 'zenburn-theme)
(setq theme-to-load 'solarized-light)

(load-theme theme-to-load t)

(when is-mac
  (set-default-font "Inconsolata LGC-16"))

(provide 'init-appearance)
