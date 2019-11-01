;; Auto Complete related configurations

(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-limit 10
	company-idle-delay .2)

(use-package flx
  :ensure t)

(use-package smex
  :ensure t)

(use-package ivy
  :ensure t
  :config

  (ivy-mode 1)
  (setq
    ivy-initial-inputs-alist nil
    ivy-use-virtual-buffers t
    ivy-re-builders-alist '((counsel-find-file . ivy--regex-fuzzy)
                             (counsel-git . ivy--regex-fuzzy)
                             (t . ivy--regex-plus))
    ivy-display-style 'fancy)

  (global-set-key (kbd "C-z") 'ivy-immediate-done))

(use-package swiper
  :ensure t
  :after ivy
  :config
  (global-set-key (kbd "s-f") 'swiper)
  (global-set-key (kbd "C-s") 'swiper))

(use-package counsel
  :ensure t
  :after ivy
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "s-p") 'counsel-git)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))

(provide 'editor/autocompletion)
