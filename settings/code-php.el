;; PHP Packages

(use-package php-mode
  :ensure t)

(use-package company-php
  :ensure t
  :config
  (add-hook 'php-mode-hook
	    '(lambda ()
	       (require 'company-php)
	       (company-mode t)
	       (add-to-list 'company-backends 'company-ac-php-backend ))))

(provide 'code-php)
