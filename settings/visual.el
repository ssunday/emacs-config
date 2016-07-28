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

(load-theme 'atom-one-dark t)

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

(require 'clojure-mode-extra-font-locking)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'visual)
