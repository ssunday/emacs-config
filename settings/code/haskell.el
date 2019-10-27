;; Haskell Settings

(use-package haskell-mode
  :ensure t)

(use-package company-ghc
  :ensure t
  :config
  (add-to-list 'company-backends
    '(company-ghc :with company-dabbrev-code))
  (custom-set-variables '(company-ghc-show-info t)))

(provide 'code/haskell)
