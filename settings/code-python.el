;; Python Packages

(add-hook 'python-mode-hook
  (lambda ()
    (setq tab-width 2
          python-indent 2)))

(provide 'code-python)
