(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)

(electric-indent-mode 1)

(use-package indent-guide
  :ensure t
  :config (indent-guide-global-mode))

(provide 'editor/whitespace)
