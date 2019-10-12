(require 'package)

(setq package-archives
  '(
     ("melpa-stable" . "https://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     )
  package-archive-priorities
  '(
     ("melpa-stable" . 4)
     ("gnu" . 2)
     ("melpa" . 0)
     )
  )

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'packages)
