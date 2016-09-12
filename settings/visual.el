;; (defun set-frame-size-according-to-resolution ()
;;   (interactive)
;;   (progn
;;     (if (> (x-display-pixel-width) 1280)
;; 	(add-to-list 'default-frame-alist (cons 'width 150))
;;       (add-to-list 'default-frame-alist (cons 'width 90)))
;;     (add-to-list 'default-frame-alist
;; 		 (cons 'height (/ (- (x-display-pixel-height) 80)
;; 				  (frame-char-height))))))

(setq initial-frame-alist '((left . 50) (top . 50)))

;; (set-frame-size-according-to-resolution)

(setq frame-title-format '(buffer-file-name "%f" ("%b"))
      inhibit-splash-screen t
      initial-scratch-message nil
      fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
				   fringe-indicator-alist))
(scroll-bar-mode -1)
(tool-bar-mode -1)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(menu-bar-mode -1)

(global-linum-mode t)
(global-hl-line-mode 1)

(use-package diff-hl
  :ensure t
  :config (add-hook 'prog-mode-hook 'diff-hl-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))

(use-package hlinum
  :ensure t
  :config (hlinum-activate))

(use-package stripe-buffer
  :ensure t
  :config (add-hook 'dired-mode-hook 'stripe-listify-buffer)
  (add-hook 'ibuffer-mode-hook 'stripe-listify-buffer)
  (face-remap-add-relative 'stripe-highlight '((:background "#4A4A4A"))))

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(use-package atom-one-dark-theme
  :ensure t
  :config (load-theme 'atom-one-dark t))

;; (use-package material-theme
;;   :if (not window-system)
;;   :ensure t
;;   :config (load-theme 'material t))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure t
  :config (define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
	    (lambda () (rainbow-mode 1)))

  (my-global-rainbow-mode 1))

(use-package beacon
  :ensure t
  :config (beacon-mode 1))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'visual)
