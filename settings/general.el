;;Buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;Random Settings
(setq inhibit-startup-message t)
(setq mac-command-key-is-meta nil)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	kill-buffer-query-functions))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(global-auto-revert-mode)

(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

;;Auto Completion

(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode)
          (setq company-tooltip-limit 20)
	  (setq company-idle-delay .3))

;;Undo-Redo key-mappings

(use-package undo-tree
  :ensure t
  :bind (("C-z" . undo-tree-undo)
	 ("C-S-z" . undo-tree-redo))
  :config (global-undo-tree-mode))

;;Indent

(use-package indent-guide
  :ensure t
  :config (indent-guide-global-mode))

;;Neotree
(use-package neotree
  :ensure t
  :bind (("M-t" . neotree-toggle))
  :config (setq neo-smart-open t
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

(use-package flx
  :ensure t)

(use-package visual-regexp
  :ensure t
  :bind (("s-r" . vr/replace)))

(use-package smex
  :ensure t)

(use-package swiper
  :ensure t
  :bind (("\C-s" . swiper)
	 ("s-f" . swiper))
  :config (ivy-mode 1)
          (setq ivy-use-virtual-buffers t)
	  (setq ivy-initial-inputs-alist nil)
	  (setq ivy-re-builders-alist
		'((counsel-find-file . ivy--regex-fuzzy)
		  (counsel-git . ivy--regex-fuzzy)
		  (t . ivy--regex-plus)))
	  (setq ivy-display-style 'fancy))

(use-package counsel
  :ensure t
  :bind (("C-x C-f" . counsel-find-file)
	 ("M-x" . counsel-M-x)
	 ("M-y" . counsel-yank-pop)
	 ("s-p" . counsel-git)))

(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(use-package ag
  :ensure t
  :bind (("s-F" . ag))
  :config (set-exec-path-from-shell-PATH)
          (setq ag-highlight-search t)
          (setq ag-reuse-window t)
	  (setq ag-reuse-buffers t))

(provide 'general)
