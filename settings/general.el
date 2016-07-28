;;Neotree
(require 'neotree)
(setq neo-smart-open t
      neo-show-header nil
      neo-show-hidden-files t
      neo-banner-message nil
      neo-create-file-auto-open t
      neo-keymap-style 'concise
      neo-window-width 25)

(customize-set-value 'neo-keymap-style 'concise)
(set-face-foreground 'neo-dir-link-face "SlateGray2")
(set-face-foreground 'neo-file-link-face "grey88")
(global-set-key (kbd "M-t") 'neotree-toggle)

(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;;Auto Completion

(require 'flx-ido)
(require 'ido-vertical-mode)
(require 'ido-ubiquitous)
(require 'company)
(require 'jquery-doc)
(require 'dumb-jump)

(global-set-key (kbd "M-s g") 'dumb-jump-go)
(global-set-key (kbd "M-s b") 'dumb-jump-back)

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(ido-everywhere 1)
(flx-ido-mode 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)

(add-hook 'after-init-hook 'global-company-mode)
(require 'company-web-html)

(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

(setq company-tooltip-limit 20)
(setq company-idle-delay .3)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

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

;;Find stuff

(global-unset-key (kbd "s-p"))
(global-unset-key (kbd "s-F"))
(global-unset-key (kbd "s-r"))

(global-set-key (kbd "s-p") 'find-file-in-repository)
(global-set-key (kbd "s-F") 'rgrep)
(global-set-key (kbd "s-r") 'replace-string)

(provide 'general)
