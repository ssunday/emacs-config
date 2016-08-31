(package-initialize)

(setq settings-path "~/.emacs.d/settings")
(add-to-list 'load-path settings-path)

(require 'packages)
(require 'tab)
(require 'general)
(require 'visual)
