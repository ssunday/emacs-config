;; General Emacs Settings

(setq gc-cons-threshold 20000000
  gc-cons-percentage 0.6)

(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq ring-bell-function 'ignore
      backup-inhibited t
      auto-save-default nil
      create-lockfiles nil
      x-select-enable-clipboard t
      confirm-nonexistent-file-or-buffer nil
      mouse-wheel-progressive-speed nil
      mac-command-key-is-meta nil
      mouse-drag-copy-region nil)

(global-auto-revert-mode)

(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1))

(provide 'core/general)
