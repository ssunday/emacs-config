;; Ruby Packages

(use-package rubocop
  :ensure t)

(use-package robe
  :ensure t)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(setq ruby-insert-encoding-magic-comment nil)

(provide 'code/ruby)
