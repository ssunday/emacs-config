;; Devops related languages/packages

(use-package company-ansible
  :ensure t
  :config
  (add-to-list 'company-backends 'company-ansible))

(use-package apache-mode
  :ensure t
  :config (setq apache-indent-level 2))

(use-package dockerfile-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(use-package docker-compose-mode
  :ensure t)

(use-package terraform-mode
  :ensure t)

(provide 'code/devops)
