(use-package visual-regexp
  :ensure t
  :bind (("s-r" . vr/replace)))

(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t
        ag-reuse-window t
        ag-reuse-buffers t)
  :bind
  (("s-F" . ag)))

(use-package dash
  :ensure t)

(provide 'editor/searching)
