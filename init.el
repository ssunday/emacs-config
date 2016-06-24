
(require 'package)
(setq package-archives
             '(("gnu" . "http://elpa.gnu.org/packages/")
               ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(setq package-check-signature nil)

(defvar my-packages '(ac-js2
                      atom-one-dark-theme
                      anzu
                      cider
                      clojure-mode-extra-font-locking
                      coffee-mode
                      company
                      company-web
                      dash
                      diff-hl
                      dumb-jump
                      find-file-in-repository
                      flx
                      flx-ido
                      flx-isearch
                      highlight-parentheses
                      ido-vertical-mode
                      ido-ubiquitous
                      ido-completing-read+
                      indent-guide
                      jekyll-modes
                      jquery-doc
                      js3-mode
                      json-mode
                      markdown-mode
                      mustache-mode
                      neotree
                      powerline
                      python-mode
                      rainbow-delimiters
                      rainbow-mode
                      redo+
                      slime
                      slim-mode
                      smex
                      smooth-scrolling
                      spaceline
                      systemd
                      tabbar
                      undo-tree
                      web-mode))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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

;;Tabbar
(require 'tabbar)

(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :height 1.0
 :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :height 1.0
 :box '(:line-width 5 :color "gray30" :style nil))

(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :height 1.0
 :box '(:line-width 5 :color "gray75" :style nil))

(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :height 1.0
 :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
 'tabbar-separator nil
 :height 1.0
 :background "gray20"
 :height 0.6)

(custom-set-variables
 '(tabbar-separator (quote (0.7))))

(defun tabbar-buffer-tab-label (tab)
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(defun my-tabbar-buffer-groups ()
 (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
             ((eq major-mode 'dired-mode) "emacs")
             (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

(setq mac-command-key-is-meta nil)

(global-set-key (kbd "s-<left>") 'tabbar-backward)
(global-set-key (kbd "s-<right>") 'tabbar-forward)

(tabbar-mode t)

;;Stuff
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;;Auto Completion

(require 'flx-ido)
(require 'ido-vertical-mode)
(require 'ido-ubiquitous)
(require 'company)
(require 'jquery-doc)

(dumb-jump-mode)

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

;;Random Display

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 140))
           (add-to-list 'default-frame-alist (cons 'width 90)))
    (add-to-list 'default-frame-alist
         (cons 'height (/ (- (x-display-pixel-height) 90)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

(global-linum-mode t)
(global-diff-hl-mode)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

;;Font Locking

(defface font-lock-func-face
    '((nil (:foreground "#ca3bd1"))
      (t (:italic t)))
  "Font Lock mode face used for function calls."
  :group 'font-lock-highlighting-faces)

(font-lock-add-keywords
 'emacs-lisp-mode
 '(("(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>"
    1 'font-lock-func-face)))

(font-lock-add-keywords
 'clojure-mode
 '(("(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>"
    1 'font-lock-func-face)))

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

;;Theme
(load-theme 'atom-one-dark t)
;(load-theme 'spacemacs-dark t)
;;(load-theme 'material t)

(global-anzu-mode +1)
(require 'spaceline-config)
(spaceline-emacs-theme)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(global-hl-line-mode 1)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(require 'clojure-mode-extra-font-locking)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
