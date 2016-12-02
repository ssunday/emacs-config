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
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2))

(use-package company-web
  :ensure t
  :after company)

(setq css-indent-offset 2)

(provide 'code-web)
