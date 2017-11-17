
(use-package rubocop
  :ensure t)

(use-package robe
  :ensure t)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(provide 'code-ruby)
