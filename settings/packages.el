(require 'package)
(setq package-archives
             '(("gnu" . "http://elpa.gnu.org/packages/")
               ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(setq package-check-signature nil)

(defvar my-packages '(ag
                      atom-one-dark-theme
                      auto-package-update
		      beacon
                      cider
                      clojure-mode-extra-font-locking
                      coffee-mode
                      company
		      company-tern
                      company-web
                      counsel
                      dash
                      diff-hl
                      dumb-jump
                      flx
                      highlight-parentheses
		      hlinum
                      indent-guide
                      jekyll-modes
                      json-mode
                      markdown-mode
                      material-theme
		      mode-icons
                      mustache-mode
                      neotree
                      powerline
                      python-mode
                      rainbow-delimiters
                      rainbow-mode
                      redo+
		      sass-mode
		      scss-mode
		      slime
                      slim-mode
                      smex
                      smooth-scrolling
                      spaceline
		      swiper
                      systemd
                      tabbar
		      tern
                      undo-tree
                      web-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;(require 'auto-package-update)
;;(auto-package-update-maybe)

(provide 'packages)
