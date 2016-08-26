(require 'package)

(setq package-archives
             '(("gnu" . "http://elpa.gnu.org/packages/")
               ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(setq package-check-signature nil)

(defvar my-packages '(ag
                      atom-one-dark-theme
		      beacon
                      cider
                      clojure-mode-extra-font-locking
                      coffee-mode
                      company
		      company-go
		      company-tern
                      company-web
                      counsel
                      dash
                      diff-hl
                      dumb-jump
                      enh-ruby-mode
                      evil
                      flx
		      go-mode
                      highlight-parentheses
		      hlinum
                      indent-guide
		      jdee
                      jekyll-modes
                      json-mode
                      markdown-mode
                      material-theme
                      mustache-mode
                      neotree
                      python-mode
                      rainbow-delimiters
                      rainbow-mode
		      robe
                      rspec-mode
		      sass-mode
		      scss-mode
		      slime
                      slim-mode
                      smex
                      smooth-scrolling
		      swiper
                      systemd
                      tabbar
		      tern
                      undo-tree
                      web-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
