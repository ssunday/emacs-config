(package-initialize)

(setq custom-file "~/.emacs.d/.emacs-custom.el")

(add-to-list 'load-path "~/.emacs.d/settings")

(require 'packages)

;; Core - Setup

(require 'core/general)
(require 'core/completion-ivy)
(require 'core/keys-hydra)

;; Core - Visual

(require 'core/sidebar)
(require 'core/tab)
(require 'core/visual)
(require 'core/modeline)

;; Code/Programming Languages

(require 'code/lisp)
(require 'code/data)
(require 'code/elixir)
(require 'code/js)
(require 'code/php)
(require 'code/python)
(require 'code/ruby)
(require 'code/web)
(require 'code/devops)

(load custom-file)
