;; Mode line setup

(setq-default
 mode-line-format
 '((:propertize "%4l:" 'face mode-line-position-face)
   (:eval (propertize "%3c" 'face 'mode-line-position-face))
   "     "
   (:eval
    (cond (buffer-read-only
           (propertize " RO " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize " ** " 'face 'mode-line-modified-face))
          (t "     ")))
   "     "
   (:propertize (:eval (shorten-directory default-directory 30))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   "     "
   (vc-mode vc-mode)
   "     ["
   (:propertize mode-name
               face mode-line-mode-face)
   "]"
   ))

;; Helper function

(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces

(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)

(set-face-attribute 'mode-line nil
    :foreground "gray60"
    :background "#3a3a3a"
    :inverse-video nil
    :height 1.0
    :box '(:line-width 6 :color "#3a3a3a"))
(set-face-attribute 'mode-line-inactive nil
    :foreground "gray80"
    :background "#545454"
    :inverse-video nil
    :height 1.0
    :box '(:line-width 6 :color "#545454"))
(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "#4271ae"
    :box '(:line-width 2 :color "#4271ae"))
(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "#ffffff"
    :background "#c82829"
    :box '(:line-width 2 :color "#c82829"))
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#00B8A1"
    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray80")

(provide 'core/modeline)
