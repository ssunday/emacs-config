(package-initialize)

(setq settings-path "~/.emacs.d/settings")
(add-to-list 'load-path settings-path)

(require 'packages)

(require 'general)

(require 'code-lisp)
(require 'code-data)
(require 'code-js)
(require 'code-web)
(require 'code-ruby)

(require 'tab)
(require 'visual)
(require 'modeline)
