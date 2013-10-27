(setq load-path
	  (append
	   (list
		(expand-file-name "~/mylisp")
		(expand-file-name "~/mylisp/apel")
		(expand-file-name "~/mylisp/navi2ch")
		)load-path))

;;; ���ܸ�Ķ�
;;; utf �ˤ���ʤ�ʲ��򥳥���
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; �����Х����
;(global-set-key [f3]  'ibuffer)
;(global-set-key [f5]  'folding-mode)
;(global-set-key [f7]  'enlarge-window-horizontally)
;(global-set-key [f8]  'enlarge-window)
(global-set-key [delete] 'delete-backward-char)
(global-set-key [kp-delete] 'delete-backward-char)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-p" 'scroll-down)
(global-set-key "\M-n" 'scroll-up)
(global-set-key "\C-x\C-n" 'goto-line)
(global-set-key "\C-_" 'undo)
(global-set-key "\C-u" 'undo)
(global-set-key "\C-x\C-u" 'universal-argument)
(define-key minibuffer-local-completion-map "\C-w" 'backward-kill-word)  ;; �ߥ˥Хåե���ñ����
(global-set-key "\C-x\C-r" 'point-to-register)
(global-set-key "\C-x\C-j" 'jump-to-register)
(global-unset-key "\C-z")

;;;; ���ܾ���
;; ��˥塼�С���ɽ�����ʤ�
(menu-bar-mode 0)
;; ���֤�ɽ������
(display-time)
;; shift + �����ʬ�䥦����ɥ��֤��ư
(windmove-default-keybindings)
;; �Хå����åפϤ��ʤ�
(setq make-backup-files nil)
;; �������ȥ��åץ�å�������ɽ�����ʤ�
(setq inhibit-startup-message t)
;; �Կ�ɽ��
(column-number-mode t)
;; ���̥ե�����α�����ǽ�ˤ���
(auto-compression-mode 1)
;; ʸ�����ޤ��֤�
(setq truncate-lines t)
(setq truncate-partial-width-windows t)
;; �䴰������ʸ��/��ʸ������̤��ʤ�
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; ����ǥ������
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(defun indent-and-next-line ()
  (interactive)
  (indent-according-to-mode)
  (next-line 1))
;; �����ζ����Ĵɽ��
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")
;; ���顼����
(require 'color-theme)
(color-theme-initialize)
(global-font-lock-mode t)
(color-theme-sp1rytus)
;;;;
(setq transient-mark-mode t)
;; folding mode
(autoload 'folding-mode "folding" nil t)
;; ibuffer mode
(require 'ibuffer)
;; smarty-mode
;(require 'smarty-mode)
;(add-to-list 'auto-mode-alist (cons "\\.tpl\\'" 'smarty-mode))
;(autoload 'smarty-mode "smarty-mode" "Smarty Mode" t)

;; php-mode
(require 'php-mode)
;(require 'yasnippet)
;(yas/load-directory "/usr/local/share/emacs23/site-lisp/snippets")
;(add-to-list 'yas/extra-mode-hooks
;             'php-mode-hook)
;(setq-default tab-width 4)
(setq auto-mode-alist
      (cons (cons "\\.\\(phtml\\|ctp\\|thtml\\|inc\\|php[s345]?\\)$" 'php-mode) auto-mode-alist))
      (autoload 'php-mode "php-mode" "PHP mode" t)
;(yas/initialize)

;; hook �Ѥδؿ������
(defun my-c-mode-common-hook ()
  ;; my-c-stye ��ͭ���ˤ���
  (c-set-style "my-c-style")

  ;;   ;; ���Υ������뤬�ǥե���Ȥ��Ѱդ���Ƥ���Τ����򤷤Ƥ�褤
  ;; (c-set-style "k&r")
  ;;   (c-set-style "gnu")
  ;;   (c-set-style "cc-mode")
  ;;   (c-set-style "stroustrup")
  ;;   (c-set-style "ellemtel")
  ;;   ;; ��¸�Υ���������ѹ�������ϼ��Τ褦�ˤ���
  ;;   (c-set-offset 'member-init-intro '++)

  ;; ����Ĺ������
  (setq tab-width 4)

  ;; ���֤�����˥��ڡ�����Ȥ�
  ;;(setq indent-tabs-mode t)

  ;; ��ư����(auto-newline)��ͭ���ˤ��� (C-c C-a)
  (c-toggle-auto-state t)

  ;; Ϣ³�������ΰ����(hungry-delete)��ͭ���ˤ��� (C-c C-d)
  (c-toggle-hungry-state t)

  ;; ���ߥ����Ǽ�ư���Ԥ��ʤ�
  (setq c-hanging-semi&comma-criteria nil)

  ;; ���å�����μ�ư���Խ���������
   (setq c-hanging-braces-alist
  	'(
  	  (class-open)          ; ���饹�����'{'
  	  (class-close)         ; ���饹�����'}'
  	  (defun-open)          ; �ؿ������'{'
  	  (defun-close)         ; �ؿ������'}'
  	  (inline-open)         ; ���饹��Υ���饤��ؿ������'{'
  	  (inline-close)        ; ���饹��Υ���饤��ؿ������'}'
  	  (brace-list-open)     ; ��󷿡����������'{'
  	  (brace-list-close)    ; ��󷿡����������'}'
  	  (block-open)          ; ���ơ��ȥ��Ȥ�'{'
  	  (block-close)         ; ���ơ��ȥ��Ȥ�'}'
  	  (substatement-open)   ; ���֥��ơ��ȥ���(if ʸ��)��'{'
  	  (statement-case-open) ; case ʸ��'{'
  	  (extern-lang-open)    ; ¾����ؤΥ�󥱡�������� '{'
  	  (extern-lang-close)   ; ¾����ؤΥ�󥱡�������� '}'
  	  (inexpr-class-open)
  	  (inexpr-class-close)))

  ;; �����Х���ɤ��ɲ�
  ;; ------------------
  ;; C-m	���ԡܥ���ǥ��
  ;; C-c c	����ѥ��륳�ޥ�ɤε�ư
  ;; C-h	����ΰ����
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (define-key c-mode-base-map "\C-cc" 'compile)
  (define-key c-mode-base-map "\C-h" 'c-electric-backspace)

  ;;   ;; ����ѥ��륳�ޥ�ɤ�����
  ;;   (setq compile-command "make -k" )   ; GNU make
  ;;   (setq compile-command "nmake /NOLOGO /S") ; VC++ �� nmake

  ) ;; my-c-mode-common-hook

;; �⡼�ɤ�����Ȥ��˸ƤӽФ� hook ������
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;######################################
;; Redo
;;######################################
(require 'redo)
(global-set-key "\M-_" 'redo)

;;######################################
;; kill-summary
;;######################################
(autoload 'kill-summary "kill-summary" nil t)
(global-set-key "\M-y" 'kill-summary)

;;######################################
;; navi2ch
;;######################################
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)

;;######################################
;; Elscreen
;;######################################
;(when (locate-library "elscreen")
;  (setq elscreen-prefix-key "\C-z")
;  (require 'elscreen))
;(global-set-key "\M-}" 'elscreen-next)
;(global-set-key "\M-{" 'elscreen-previous)
;(define-key elscreen-map "\C-k" 'elscreen-kill-screen-and-buffers)

;;######################################
;; tabbar
;;######################################
(setq tabber-prefix-key "\C-z")
(require 'tabbar)
(tabbar-mode 1)
;; ���롼�ײ����ʤ�
(setq tabbar-buffer-groups-function nil)
;; ����ɽ�������ܥ����̵����
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
;;; ���֤�Ĺ��
(setq tabbar-separator '(1.0))
;; �����ѹ�
(set-face-attribute
 'tabbar-default nil
 :background "white")
(set-face-attribute
 'tabbar-unselected nil
 :foreground "black"
 :box nil)
(set-face-attribute ;�����ƥ��֤ʥ���
 'tabbar-selected nil
 :background "blue"
 :foreground "white"
 :box nil)
;; ���֤�ɽ��������Хåե�������
(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                          ((equal "*scratch*" (buffer-name b)) b)
                               ((char-equal ?* (aref (buffer-name b) 0)) nil)
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
(global-set-key (kbd "C-z n") 'tabbar-forward-tab)
(global-set-key (kbd "C-z p") 'tabbar-backward-tab)
(global-set-key (kbd "C-z C-n") 'tabbar-forward-tab)
(global-set-key (kbd "C-z C-p") 'tabbar-backward-tab)
(global-set-key "\C-z\C-f" 'find-file)
(global-set-key (kbd "C-z k") 'kill-buffer-and-window)
(global-set-key (kbd "C-z C-k") 'kill-buffer-and-window)
