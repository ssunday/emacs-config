(defun set-frame-size-according-to-resolution ()
  (interactive)
  (progn
    (when window-system
      (if (> (x-display-pixel-width) 1280)
	  (add-to-list 'default-frame-alist (cons 'width 180))
	(add-to-list 'default-frame-alist (cons 'width 90)))
      (add-to-list 'default-frame-alist
		   (cons 'height (/ (- (x-display-pixel-height) 80)
				    (frame-char-height)))))))

(setq default-frame-alist '((left . 150) (top . 40)))

(when (fboundp 'menu-bar-mode) (menu-bar-mode 0))
(when (fboundp 'tool-bar-mode) (tool-bar-mode 0))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))

(set-frame-size-according-to-resolution)

(setq frame-title-format '(buffer-file-name "%f" ("%b"))
      inhibit-splash-screen t
      inhibit-startup-message t
      initial-scratch-message nil
      global-font-lock-mode 1
      frame-resize-pixelwise t
      fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
				   fringe-indicator-alist))

(use-package atom-one-dark-theme
  :if window-system
  :ensure t
  :config (load-theme 'atom-one-dark t))

(use-package material-theme
  :if (not window-system)
  :ensure t
  :config (load-theme 'material t))

(use-package stripe-buffer
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'stripe-listify-buffer)
  (add-hook 'ibuffer-mode-hook 'stripe-listify-buffer)
  (add-hook 'package-menu-mode-hook 'stripe-listify-buffer))

(global-linum-mode t)
(global-hl-line-mode 1)

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

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1))

(if (daemonp)
  (add-hook 'after-make-frame-functions
    (lambda (frame)
      (select-frame frame)
      (load-theme 'atom-one-dark t)
      (add-hook 'dired-mode-hook 'stripe-listify-buffer)
      (add-hook 'ibuffer-mode-hook 'stripe-listify-buffer)
      (add-hook 'package-menu-mode-hook 'stripe-listify-buffer)
      (set-frame-size-according-to-resolution))))

(provide 'core/visual)
