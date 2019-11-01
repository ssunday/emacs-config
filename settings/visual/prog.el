(use-package stripe-buffer
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'stripe-listify-buffer)
  (add-hook 'ibuffer-mode-hook 'stripe-listify-buffer)
  (add-hook 'package-menu-mode-hook 'stripe-listify-buffer))

(use-package diff-hl
  :ensure t
  :config (add-hook 'prog-mode-hook 'diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(provide 'visual/prog)
