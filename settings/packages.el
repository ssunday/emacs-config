(require 'package)

(setq package-archives
             '(("gnu" . "http://elpa.gnu.org/packages/")
               ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(setq package-check-signature nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'packages)
