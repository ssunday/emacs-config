;;General Emacs Settings

(setq ring-bell-function 'ignore)

(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(setq backup-inhibited t
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

;; Whitespace

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)

(electric-indent-mode 1)

;;Buffers

(use-package ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config
  (setq ibuffer-default-sorting-mode 'major-mode))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;Auto Completion

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-limit 10
	company-idle-delay .2))

;;Undo-Redo key-mappings

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

;;Indent

(use-package indent-guide
  :ensure t
  :config (indent-guide-global-mode))

;;Neotree

(use-package neotree
  :ensure t
  :bind (("M-t" . neotree-toggle))
  :config
  (setq neo-smart-open t
	neo-show-hidden-files t
	neo-banner-message nil
	neo-create-file-auto-open t
	neo-dont-be-alone t
	neo-vc-integration '(face char)
	neo-window-fixed-size nil)
  (set-face-foreground 'neo-dir-link-face "SlateGray2")
  (set-face-foreground 'neo-file-link-face "grey88"))

;;Finding/Searching

(use-package dumb-jump
  :ensure t
  :bind (("M-s g" . dumb-jump-go)
	 ("M-s b" . dumb-jump-back)))

(use-package visual-regexp
  :ensure t
  :bind (("s-r" . vr/replace)
	 ("M-%" . vr/query-replace)))

(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(use-package ag
  :ensure t
  :bind
  (("s-F" . ag))
  :config
  (set-exec-path-from-shell-PATH)
  (setq ag-highlight-search t
	ag-reuse-window t
	ag-reuse-buffers t))

;; VCS

(use-package magit
  :ensure t
  :bind
  (("s-g" . magit-status))
)

(provide 'general)
