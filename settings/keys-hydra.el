;;Hydras

(use-package hydra
  :ensure t
  :config
  (require 'ibuffer)

  (defhydra hydra-ibuffer-main (:color pink :hint nil)
    "
| ^Mark^        | ^Actions^        | ^View^
^----^--------+-^-------^--------+-^----^----------
| _m_: mark     | _D_: delete      | _g_: refresh |
| _u_: unmark   | _S_: save        | _s_: sort    |
| _*_: specific | _a_: all actions | _/_: filter  |
^----^--------+-^-------^--------+-^----^----------
"
    ("m" ibuffer-mark-forward)
    ("u" ibuffer-unmark-forward)
    ("*" hydra-ibuffer-mark/body :color blue)

    ("D" ibuffer-do-delete)
    ("S" ibuffer-do-save)
    ("a" hydra-ibuffer-action/body :color blue)

    ("g" ibuffer-update)
    ("s" hydra-ibuffer-sort/body :color blue)
    ("/" hydra-ibuffer-filter/body :color blue)

    ("o" ibuffer-visit-buffer-other-window "other window" :color blue)
    ("q" ibuffer-quit "quit ibuffer" :color blue)
    ("." nil "toggle hydra" :color blue))

  (defhydra hydra-ibuffer-mark (:color teal :columns 5
				       :after-exit (hydra-ibuffer-main/body))
    "Mark"
    ("*" ibuffer-unmark-all "unmark all")
    ("M" ibuffer-mark-by-mode "mode")
    ("m" ibuffer-mark-modified-buffers "modified")
    ("u" ibuffer-mark-unsaved-buffers "unsaved")
    ("s" ibuffer-mark-special-buffers "special")
    ("r" ibuffer-mark-read-only-buffers "read-only")
    ("/" ibuffer-mark-dired-buffers "dired")
    ("e" ibuffer-mark-dissociated-buffers "dissociated")
    ("h" ibuffer-mark-help-buffers "help")
    ("z" ibuffer-mark-compressed-file-buffers "compressed")
    ("b" hydra-ibuffer-main/body "back" :color blue))

  (defhydra hydra-ibuffer-action (:color teal
					 :columns 4
					 :after-exit
					 (if (eq major-mode 'ibuffer-mode)
					     (hydra-ibuffer-main/body)))
    "Action"
    ("A" ibuffer-do-view "view")
    ("E" ibuffer-do-eval "eval")
    ("F" ibuffer-do-shell-command-file "shell-command-file")
    ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
    ("H" ibuffer-do-view-other-frame "view-other-frame")
    ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
    ("M" ibuffer-do-toggle-modified "toggle-modified")
    ("O" ibuffer-do-occur "occur")
    ("P" ibuffer-do-print "print")
    ("Q" ibuffer-do-query-replace "query-replace")
    ("R" ibuffer-do-rename-uniquely "rename-uniquely")
    ("T" ibuffer-do-toggle-read-only "toggle-read-only")
    ("U" ibuffer-do-replace-regexp "replace-regexp")
    ("V" ibuffer-do-revert "revert")
    ("W" ibuffer-do-view-and-eval "view-and-eval")
    ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
    ("b" nil "back"))

  (defhydra hydra-ibuffer-sort (:color amaranth :columns 3)
    "Sort"
    ("i" ibuffer-invert-sorting "invert")
    ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
    ("v" ibuffer-do-sort-by-recency "recently used")
    ("s" ibuffer-do-sort-by-size "size")
    ("f" ibuffer-do-sort-by-filename/process "filename")
    ("m" ibuffer-do-sort-by-major-mode "mode")
    ("b" hydra-ibuffer-main/body "back" :color blue))

  (defhydra hydra-ibuffer-filter (:color amaranth :columns 4)
    "Filter"
    ("m" ibuffer-filter-by-used-mode "mode")
    ("M" ibuffer-filter-by-derived-mode "derived mode")
    ("n" ibuffer-filter-by-name "name")
    ("c" ibuffer-filter-by-content "content")
    ("e" ibuffer-filter-by-predicate "predicate")
    ("f" ibuffer-filter-by-filename "filename")
    (">" ibuffer-filter-by-size-gt "size")
    ("<" ibuffer-filter-by-size-lt "size")
    ("/" ibuffer-filter-disable "disable")
    ("b" hydra-ibuffer-main/body "back" :color blue))

  (define-key ibuffer-mode-map "." 'hydra-ibuffer-main/body)

  (defhydra hydra-goto-line (goto-map "")
    "goto-line"
    ("g" goto-line "go")
    ("m" set-mark-command "mark" :bind nil)
    ("q" nil "quit"))

  (global-set-key
   (kbd "C-n")
   (defhydra hydra-move
     (:columns 2
      :body-pre (next-line))
     "move"
     ("n" next-line "next line")
     ("p" previous-line "previous line")
     ("f" forward-char "forward char")
     ("b" backward-char "backward char")
     ("a" beginning-of-line "line start")
     ("e" move-end-of-line "line end")
     ("v" scroll-up-command "scroll up")
     ("V" scroll-down-command "scroll down")
     ("l" recenter-top-bottom "recenter")))

  (defun kill-all-buffers ()
    (interactive)
    (mapc 'kill-buffer (buffer-list)))

  (defun kill-other-buffers ()
    (interactive)
    (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))

  (defun kill-buffer-to-the-right ()
    (interactive)
    (kill-buffer (other-buffer)))

  (global-set-key
   (kbd "C-x k")
   (defhydra hydra-kill-buffer
     (:color pink)
     ("k" kill-this-buffer "kill current buffer")
     ("c" kill-buffer "kill buffer cycle")
     ("a" kill-all-buffers "kill all buffers")
     ("o" kill-other-buffers "kill other buffers")
     ("q" nil "quit" :color blue)))

  )

(provide 'keys-hydra)
