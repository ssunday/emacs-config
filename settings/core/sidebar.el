(use-package neotree
  :ensure t
  :bind (("M-t" . neotree-toggle))
  :config
  (setq neo-smart-open t
    neo-show-hidden-files t
    neo-banner-message nil
    neo-create-file-auto-open t
    neo-dont-be-alone t
    neo-vc-integration '(face char)
    neo-window-fixed-size nil))

(provide 'core/sidebar)
