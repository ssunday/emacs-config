;; Tab Bar

(use-package centaur-tabs
  :ensure t
  :config
  (centaur-tabs-headline-match)
  (setq
    centaur-tabs-adjust-buffer-order t
    centaur-tabs-adjust-buffer-order 'left
    centaur-tabs-style "bar"
    centaur-tabs-height 32
    centaur-tabs-gray-out-icons 'buffer
    centaur-tabs-cycle-scope 'tabs
    centaur-tabs-close-button "X"
    centaur-tabs-modified-marker "*")

  (set-face-attribute
    'centaur-tabs-selected nil
    :background "#31343E"
    :foreground "#00eac3")
  (defun centaur-tabs-buffer-groups ()
    (list
      (cond
        ((string-equal "*" (substring (buffer-name) 0 1)) "Emacs")
        ((derived-mode-p 'dired-mode) "Directory")
        (t "User"))))
  :hook
  (dired-mode . centaur-tabs-local-mode)
  (neotree-mode . centaur-tabs-local-mode)
  :bind
  ("s-<left>" . centaur-tabs-backward)
  ("s-<right>" . centaur-tabs-forward))

(centaur-tabs-mode t)

(provide 'core/tab)
