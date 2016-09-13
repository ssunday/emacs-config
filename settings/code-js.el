;;JS development. Tern basically for syntax highlighting and code-completion.

(add-to-list 'load-path "~/.emacs.d/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

(use-package tern
  :ensure t
  :config (add-hook 'js-mode-hook (lambda () (tern-mode t)))
	  (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
	  (setq js-indent-level 2))

(use-package company-tern
  :ensure t
  :config (add-to-list 'company-backends 'company-tern))

(provide 'code-js)
