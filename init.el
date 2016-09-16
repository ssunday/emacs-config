(package-initialize)

(setq custom-file "~/.emacs.d/.emacs-custom.el")
(setq settings-path "~/.emacs.d/settings")

(add-to-list 'load-path settings-path)

(require 'packages)

;;Core Setup

(require 'general)

;;Programming Languages

(require 'code-lisp)
(require 'code-csharp)
(require 'code-data)
(require 'code-js)
(require 'code-web)
(require 'code-misc)

;;Visual

(require 'tab)
(require 'visual)
(require 'modeline)

(load custom-file)
