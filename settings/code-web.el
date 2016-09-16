;;Web Development. HTML. CSS. Mustache. ETC.

(use-package scss-mode
  :ensure t)

(use-package sass-mode
  :ensure t)

(use-package slim-mode
  :ensure t)

(use-package markdown-mode
  :ensure t)

(use-package mustache-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package company-web
  :ensure t
  :after company)

(setq css-indent-offset 2)

(provide 'code-web)
