(use-package dired-sidebar
  :ensure t
  :bind (("M-t" . dired-sidebar-toggle-sidebar))
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)
  (setq dired-sidebar-theme 'nerd)
  (setq dired-sidebar-width 30))

(provide 'sidebar)
