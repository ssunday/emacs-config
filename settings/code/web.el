;; Web Development

(use-package markdown-mode
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
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

  (set-face-attribute 'web-mode-block-delimiter-face   nil :foreground "MediumOrchid2")
  (set-face-attribute 'web-mode-block-control-face     nil :foreground "MediumOrchid2")

  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-column-highlight t)

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-comment-style 2)
  (setq web-mode-style-padding 1)
  (setq web-mode-script-padding 1)
  (setq web-mode-block-padding 0)

  (setq web-mode-enable-engine-detection t))

(setq web-mode-content-types-alist
  '(
     ("js" . "\\.js[x]?\\'")
     ("jsx" . ".*\\.jsx?")
     ("jsx" . ".*\\.tsx?")
     )
  )

(setq web-mode-engines-alist '(("django" . "\\.html\\'")))

(use-package company-web
  :ensure t
  :after company)

(setq scss-compile-at-save nil)
(setq css-indent-offset 2)

(provide 'code/web)
