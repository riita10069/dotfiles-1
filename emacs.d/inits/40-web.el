(use-package web-mode
  :init
  (add-hook 'web-mode-hook (lambda()
                             (setq indent-tabs-mode nil)
                             (setq tab-width 2)
                             ))
  )
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'". web-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset   4))
(add-hook 'web-mode-hook 'web-mode-hook)
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "white")
(set-face-attribute 'web-mode-html-tag-face nil :foreground "LightSteelBlue")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "color-222")
