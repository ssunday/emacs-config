(use-package ibuffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-default-sorting-mode 'major-mode)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(provide 'core/buffers)
