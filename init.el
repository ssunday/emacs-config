(package-initialize)

(setq custom-file "~/.emacs.d/.emacs-custom.el")
(setq settings-path "~/.emacs.d/settings")

(add-to-list 'load-path settings-path)

(require 'packages)

;;Core Setup

(require 'general)
(require 'completion-ivy)
(require 'keys-hydra)

;;Programming Languages

(require 'code-lisp)
(require 'code-data)
(require 'code-haskell)
(require 'code-js)
(require 'code-php)
(require 'code-web)
(require 'code-misc)
(require 'devops)

;;Visual

(require 'tab)
(require 'visual)
(require 'modeline)

(load custom-file)
