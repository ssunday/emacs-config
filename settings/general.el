;;Neotree
(require 'neotree)
(setq neo-smart-open t
      neo-show-header nil
      neo-show-hidden-files t
      neo-banner-message nil
      neo-create-file-auto-open t
      neo-dont-be-alone t
      neo-keymap-style 'concise
      neo-window-width 30)

(customize-set-value 'neo-keymap-style 'concise)
(set-face-foreground 'neo-dir-link-face "SlateGray2")
(set-face-foreground 'neo-file-link-face "grey88")
(global-set-key (kbd "M-t") 'neotree-toggle)

;;Random Settings

(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	kill-buffer-query-functions))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;;Modes

;;JS

(add-to-list 'load-path "~/.emacs.d/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(setq js-indent-level 2)

;;Ruby

(add-hook 'ruby-mode-hook 'robe-mode)

;;CSS
(setq css-indent-offset 2)

;;Auto Completion

(require 'company)
(require 'company-web-html)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'company-backends 'company-tern)

(setq company-tooltip-limit 20)
(setq company-idle-delay .3)

(global-auto-revert-mode t)

;;Switch Buffer

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;;Comment region

(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

;;Undo-Redo key-mappings

(defalias 'redo 'undo-tree-redo)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)

;;Scrolling

(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;;Indent

(require 'indent-guide)
(indent-guide-global-mode)

;;Dumb Jump
(require 'dumb-jump)
(global-set-key (kbd "M-s g") 'dumb-jump-go)
(global-set-key (kbd "M-s b") 'dumb-jump-back)

;;Finding/Searching

(require 'flx)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-initial-inputs-alist nil)

(setq ivy-re-builders-alist
      '((read-file-name-internal . ivy--regex-fuzzy)
	      (counsel-git . ivy--regex-fuzzy)
        (t . ivy--regex-plus)))

(setq ivy-display-style 'fancy)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "s-f") 'swiper)
(global-set-key (kbd "s-r") 'replace-string)

(if window-system
  (progn
    (global-set-key (kbd "s-F") 'ag)
    (global-set-key (kbd "s-p") 'counsel-git))
  (progn
    (global-set-key (kbd "C-u") 'ag)
    (global-set-key (kbd "M-p") 'counsel-git)))

(setq ag-highlight-search t)
(setq ag-reuse-window t)
(setq ag-reuse-buffers t)

(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(provide 'general)
