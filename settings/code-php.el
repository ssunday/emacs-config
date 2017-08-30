;; PHP Packages

(use-package php-mode
  :ensure t)

(defun php-mode-init ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 2))

(add-hook 'php-mode-hook 'php-mode-init)

(provide 'code-php)
