;;JS development

(setq js-indent-level 2)

(use-package coffee-mode
  :ensure t
  :config
  (custom-set-variables '(coffee-tab-width 2)))

(use-package ac-js2
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'ac-js2-mode))

(provide 'code-js)
