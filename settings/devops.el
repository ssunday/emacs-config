

(use-package company-ansible
  :ensure t
  :config
  (add-to-list 'company-backends 'company-ansible))

(use-package apache-mode
  :ensure t
  :config (setq apache-indent-level 2))

(provide 'devops)
