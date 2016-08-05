(require 'package)
(setq package-archives
             '(("gnu" . "http://elpa.gnu.org/packages/")
               ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(setq package-check-signature nil)

(defvar my-packages '(ac-js2
                      ag
                      atom-one-dark-theme
                      cider
                      clojure-mode-extra-font-locking
                      coffee-mode
                      company
                      company-web
                      counsel
                      dash
                      diff-hl
                      dumb-jump
                      flx
                      highlight-parentheses
                      indent-guide
                      jekyll-modes
                      jquery-doc
                      js3-mode
                      json-mode
                      markdown-mode
                      material-theme
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
		                  swiper
                      systemd
                      tabbar
                      undo-tree
                      web-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
