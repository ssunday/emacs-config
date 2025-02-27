(global-display-line-numbers-mode t)
(global-hl-line-mode 1)

(when (fboundp 'menu-bar-mode) (menu-bar-mode 0))
(when (fboundp 'tool-bar-mode) (tool-bar-mode 0))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))

(setq frame-title-format '(buffer-file-name "%f" ("%b"))
      inhibit-splash-screen t
      inhibit-startup-message t
      initial-scratch-message nil
      global-font-lock-mode 1
      frame-resize-pixelwise t
      fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
				   fringe-indicator-alist))

(use-package material-theme
  :if (not window-system)
  :ensure t
  :config (load-theme 'material t))

(provide 'visual/general)
