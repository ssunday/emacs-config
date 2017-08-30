;;JS development

(setq js-indent-level 2)

(use-package coffee-mode
  :ensure t
  :config
  (custom-set-variables '(coffee-tab-width 2)))

(use-package typescript-mode
  :ensure t
  :config
  (custom-set-variables '(typescript-indent-level 2)))

(use-package ac-js2
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'ac-js2-mode))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . javascript-mode))

(provide 'code-js)
