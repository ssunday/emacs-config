
(use-package rubocop
  :ensure t)

(use-package robe
  :ensure t)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(defun run-rubocop ()
  (when (eq major-mode 'ruby-mode)
    (rubocop-autocorrect-current-file)))

(add-hook 'before-save-hook #'run-rubocop)

(provide 'code-ruby)
