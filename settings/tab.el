;;Tabbar
(require 'tabbar)

(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :height 1.0
 :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :height 1.0
 :box '(:line-width 5 :color "gray30" :style nil))

(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :height 1.0
 :box '(:line-width 5 :color "gray75" :style nil))

(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :height 1.0
 :box '(:line-width 5 :color "white" :style nil))

(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))

(set-face-attribute
 'tabbar-separator nil
 :height 1.0
 :background "gray20"
 :height 0.6)

(custom-set-variables
 '(tabbar-separator (quote (0.7))))

(defun tabbar-buffer-tab-label (tab)
  (let ((label  (if tabbar--buffer-show-groups
                    (format "[%s]  " (tabbar-tab-tabset tab))
                  (format "%s  " (tabbar-tab-value tab)))))
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(defun my-tabbar-buffer-groups ()
 (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
             ((eq major-mode 'dired-mode) "emacs")
             (t "user"))))

(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

(setq mac-command-key-is-meta nil)

(if window-system
  (progn
    (global-set-key (kbd "s-<left>") 'tabbar-backward)
    (global-set-key (kbd "s-<right>") 'tabbar-forward))
  (progn
    (global-set-key (kbd "M-[") 'tabbar-backward)
    (global-set-key (kbd "M-]") 'tabbar-forward)))

(tabbar-mode t)

(provide 'tab)
