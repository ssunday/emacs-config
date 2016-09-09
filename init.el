(package-initialize)

(setq settings-path "~/.emacs.d/settings")
(add-to-list 'load-path settings-path)

(require 'packages)

(require 'general)
(require 'visual)
(require 'modeline)

(require 'code-lisp)
(require 'code-data)
(require 'code-js)
(require 'code-web)

(custom-set-variables
 '(package-selected-packages
   (quote
    (es-mode json-mode web-mode visual-regexp use-package undo-tree stripe-buffer smex slime slim-mode scss-mode sass-mode rainbow-mode rainbow-delimiters neotree material-theme markdown-mode jekyll-modes indent-guide hlinum flx dumb-jump diff-hl counsel company-web company-tern coffee-mode clojure-mode-extra-font-locking cider beacon atom-one-dark-theme ag))))
(custom-set-faces

 )
