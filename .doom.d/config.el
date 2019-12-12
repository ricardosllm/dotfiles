;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; (load! "+bindings")

;; Env vars
(setenv "SHELL" "fish")

(setq
 doom-font (font-spec :family "Fira Mono" :size 18)
 doom-big-font (font-spec :family "Fira Mono" :size 32)
 doom-theme 'doom-gruvbox

 projectile-project-search-path '("~/g/" "~/d/"))

(setq show-trailing-whitespace t)

(add-hook! 'js2-mode-hook 'eslintd-fix-mode)

(add-hook! 'before-save-hook
           'delete-trailing-whitespace)

;; Auto save
(add-to-list 'focus-out-hook (lambda () (save-some-buffers t nil)))

(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en" "--run-together" "--camel-case"))

;; String manipulation by using s package
(defun str-camel-case (beg end)
  "some words => someWords"
  (interactive "r")
  (let ((s (buffer-substring beg end)))
    (delete-region beg end)
    (insert (s-lower-camel-case s))))

;; Clojure
(add-hook! 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook! 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook! 'clojure-mode-hook #'paredit-mode)
(add-hook! 'clojurec-mode-hook #'paredit-mode)
(add-hook! 'clojurescript-mode-hook #'paredit-mode)
