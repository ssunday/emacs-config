(setq custom-file "~/.emacs.d/.emacs-custom.el")

(add-to-list 'load-path "~/.emacs.d/settings")

(require 'packages)

;; Core - Setup

;; https://github.com/Wilfred/ag.el/issues/93#issuecomment-348003505
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

(require 'core/general)
(require 'core/buffers)
(require 'core/keys-hydra)
(require 'core/sidebar)
(require 'core/tab)

;; Editor config

(require 'editor/autocompletion)
(require 'editor/searching)
(require 'editor/whitespace)

;; Visual

(require 'visual/general)
(require 'visual/daemon)
(require 'visual/modeline)
(require 'visual/prog)

;; Code/Programming Languages

(require 'code/lisp)
(require 'code/data)
(require 'code/elixir)
(require 'code/haskell)
(require 'code/js)
(require 'code/php)
(require 'code/python)
(require 'code/ruby)
(require 'code/web)
(require 'code/devops)
(require 'code/vcs)

(load custom-file)
