;; my favorite packages ここに書いたpackageがインストールされていなければ自動でインストールされる
(defvar my-favorite-packages
  '(
    ;; auto complete
    company
    ;; JavaScript
    js2-mode)
)

;;;; settings for packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; initialize package
(package-initialize)

;; update package info
(unless package-archive-contents (package-refresh-contents))

;;;; company settings

;; auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (add-to-list 'ac-modes 'text-mode)
;; (setq ac-use-menu-map t)
;; (setq ac-use-fuzzy t)

;; JavaScript settings
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;;;; set japanese environment
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;;;; settings for editing
;; show line number
(global-linum-mode t)

;; do not blink cursor
(blink-cursor-mode 0)

;; use spaces no tabs
(setq-default tab-width 2 indent-tabs-mode nil)

;; highlight cursor line
(global-hl-line-mode t)

;; show paren
(show-paren-mode 1)

;; show spaces and tabs
(global-whitespace-mode 0)

;; ctrl + k to kill line
(setq kill-whole-line t)

;; move line up|down
(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (unless (eq col 0)
      (move-to-column 0))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (forward-line -1)))

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (unless (eq col 0)
      (move-to-column 0))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)))

(global-set-key (kbd "M-p") 'move-line-up)
(global-set-key (kbd "M-n") 'move-line-down)

