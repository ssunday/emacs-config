(require 'package)
(setq package-archives
             '(("gnu" . "http://elpa.gnu.org/packages/")
               ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(setq package-check-signature nil)

(defvar my-packages '(ac-js2
                      atom-one-dark-theme
                      anzu
                      cider
                      clojure-mode-extra-font-locking
                      coffee-mode
                      company
                      company-web
                      dash
                      diff-hl
                      dumb-jump
                      find-file-in-repository
                      flx
                      flx-ido
                      flx-isearch
                      highlight-parentheses
                      ido-vertical-mode
                      ido-ubiquitous
                      ido-completing-read+
                      indent-guide
                      jekyll-modes
                      jquery-doc
                      js3-mode
                      json-mode
                      markdown-mode
                      mustache-mode
                      neotree
                      powerline
                      python-mode
                      rainbow-delimiters
                      rainbow-mode
                      redo+
                      slime
                      slim-mode
                      smex
                      smooth-scrolling
                      spaceline
                      systemd
                      tabbar
                      undo-tree
                      web-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
