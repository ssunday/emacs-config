;;Ivy related configurations

(use-package flx
  :ensure t)

(use-package smex
  :ensure t)

(use-package ivy
  :ensure t
  :bind (("C-z" . ivy-immediate-done))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-re-builders-alist '((counsel-find-file . ivy--regex-fuzzy)
				(counsel-git . ivy--regex-fuzzy)
				(t . ivy--regex-plus))
	ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :after ivy
  :bind (("\C-s" . swiper)
	 ("s-f" . swiper)))

(use-package counsel
  :ensure t
  :after ivy
  :bind (("C-x C-f" . counsel-find-file)
	 ("M-x" . counsel-M-x)
	 ("M-y" . counsel-yank-pop)
	 ("s-p" . counsel-git)))

(provide 'completion-ivy)
