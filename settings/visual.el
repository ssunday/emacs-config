(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 190))
           (add-to-list 'default-frame-alist (cons 'width 90)))
    (add-to-list 'default-frame-alist
         (cons 'height (/ (- (x-display-pixel-height) 90)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)
(menu-bar-mode -1)

(global-linum-mode t)
(hlinum-activate)
(global-diff-hl-mode)
(global-hl-line-mode 1)

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

(if window-system
  (load-theme 'atom-one-dark t)
  (load-theme 'material t))

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)

(setq-default mode-line-format `(
				 (:eval
				  (if (buffer-modified-p)
				      (propertize "\t%b    " 'face 'info-menu-star)
				    (propertize "\t%b    " 'face 'success)))
				 ,'(vc-mode vc-mode)
				 ,(propertize "\t%m" 'face 'font-lock-string-face
					      'help-echo buffer-file-coding-system)
				 ,(propertize "\tLine" 'face 'custom-face-tag)
				 " %l  "
				 ,(propertize "  Column" 'face 'custom-face-tag)
				 " %c\t"
				 ,(propertize (format-time-string "\t%H:%M")
					      'help-echo
					      (format-time-string "%c; "))))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(my-global-rainbow-mode 1)

(beacon-mode 1)

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

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'visual)
