;; This file is run at the very end of init.el, so you can use it to
;; override things or add your own packages and customizations.
(use-package xclip)
(xclip-mode 1)

;;prereq packages for magit
(use-package dash)
(use-package with-editor)
(use-package magit)

;; (require 'windsize)
;; (windsize-default-keybindings)

;;project level search with projectile
(use-package projectile)
(use-package counsel-projectile)
(global-set-key (kbd "C-c f") 'counsel-projectile-find-file)

;;color theme
(use-package monokai-theme)

;;required for projectile-ag
(use-package ag)

;;project level text search
(global-set-key (kbd "C-x C-g") 'projectile-ag)

;;join previous line alternate keybinding
(global-set-key (kbd "C-x j") 'join-line)

;;more intuitive C-a
(global-set-key (kbd "C-a") 'back-to-indentation)

(load-theme 'monokai t)

(set-face-background 'mode-line "#0087AF")

(set-face-background 'mode-line-inactive "#4E4E4E")

;;(xclip-mode 1)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-<up>")    'paredit-splice-sexp-killing-backward)
     (define-key paredit-mode-map (kbd "M-)")       'paredit-wrap-round-from-behind)
     (define-key paredit-mode-map (kbd "M-<left>")  'paredit-backward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-<right>") 'paredit-backward-barf-sexp)))

(setq ag-highlight-search t)
