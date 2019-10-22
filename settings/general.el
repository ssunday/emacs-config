;; General Emacs Settings

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
  mouse-drag-copy-region nil
  gc-cons-threshold 20000000)

(global-auto-revert-mode)

(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Whitespace

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)

(electric-indent-mode 1)

;;Buffers

(use-package ibuffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-default-sorting-mode 'major-mode)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;Auto Completion

(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-limit 10
	company-idle-delay .2)

;;Indent

(use-package indent-guide
  :ensure t
  :config (indent-guide-global-mode))

;;Finding/Searching

(use-package visual-regexp
  :ensure t)

(global-set-key (kbd "s-r") 'vr/replace)

(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(use-package ag
  :ensure t)

(use-package dash
  :ensure t)

(global-set-key (kbd "s-F") 'ag)

(set-exec-path-from-shell-PATH)
(setq ag-highlight-search t
      ag-reuse-window t
      ag-reuse-buffers t)

;; VCS

(use-package magit
  :ensure t)

(provide 'general)
