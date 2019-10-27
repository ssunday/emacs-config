(package-initialize)

(setq custom-file "~/.emacs.d/.emacs-custom.el")

(add-to-list 'load-path "~/.emacs.d/settings")

(require 'packages)

;; Core Setup

(require 'general)
(require 'completion-ivy)
(require 'keys-hydra)

;; Programming Languages

(require 'code/lisp)
(require 'code/data)
(require 'code/elixir)
(require 'code/js)
(require 'code/php)
(require 'code/python)
(require 'code/ruby)
(require 'code/web)
(require 'code/devops)

;; Visual

(require 'sidebar)
(require 'tab)
(require 'visual)
(require 'modeline)

(load custom-file)
