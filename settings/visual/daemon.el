(setq default-frame-alist '((left . 150) (top . 40)))

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

(use-package atom-one-dark-theme
  :if window-system
  :ensure t
  :config (load-theme 'atom-one-dark t))

(if (daemonp)
  (add-hook 'after-make-frame-functions
    (lambda (frame)
      (select-frame frame)
      (load-theme 'atom-one-dark t)
      (add-hook 'dired-mode-hook 'stripe-listify-buffer)
      (add-hook 'ibuffer-mode-hook 'stripe-listify-buffer)
      (add-hook 'package-menu-mode-hook 'stripe-listify-buffer)
      (set-frame-size-according-to-resolution))))


(provide 'visual/daemon)
