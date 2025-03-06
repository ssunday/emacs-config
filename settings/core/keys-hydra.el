;; Hydras

(use-package hydra
  :ensure t
  :config
  (require 'ibuffer)

  (defhydra hydra-goto-line (goto-map "")
    "goto-line"
    ("g" goto-line "go")
    ("m" set-mark-command "mark" :bind nil)
    ("q" nil "quit"))

  (defun kill-other-buffers ()
    (interactive)
    (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))

  (global-set-key
   (kbd "C-x k")
   (defhydra hydra-kill-buffer
     (:color pink)
     ("k" (kill-buffer (current-buffer)) "kill current buffer")
     ("o" kill-other-buffers "kill other buffers")
     ("q" nil "quit" :color blue))
   )

  )

(provide 'core/keys-hydra)
