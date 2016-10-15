;;Settings Related to Lisp and Lisp-like language  Development

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package clojure-mode-extra-font-locking
  :ensure t)

(use-package dash
  :ensure t)

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package slime-company
  :ensure t
  :config
  (slime-setup '(slime-fancy slime-company)))

(defface font-lock-func-face
  '((nil (:foreground "#ca3bd1"))
    (t (:italic t)))
  "Font Lock mode face used for function calls."
  :group 'font-lock-highlighting-faces)

(font-lock-add-keywords
 'clojure-mode
 '(("(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>"
    1 'font-lock-func-face)))

(font-lock-add-keywords
 'emacs-lisp-mode
 '(("(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>"
    1 'font-lock-func-face)))

(provide 'code-lisp)
