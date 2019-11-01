(use-package visual-regexp
  :ensure t)

(global-set-key (kbd "s-r") 'vr/replace)

(defun set-exec-path-from-shell-PATH ()
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(use-package ag
  :ensure t)

(use-package dash
  :ensure t)

(global-set-key (kbd "s-F") 'ag)

(set-exec-path-from-shell-PATH)
(setq ag-highlight-search t
      ag-reuse-window t
      ag-reuse-buffers t)
      
(provide 'editor/searching)
