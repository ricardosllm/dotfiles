;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ricardo Mota"
      user-mail-address "ricardo@gini.co")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/gini-shared/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "Fira Mono" :size 16 :weight 'normal))


;; (package! key-chord)


(setq-default evil-escape-key-sequence "fd")

(map! :leader :desc "Switch Window 1" "1" #'winum-select-window-1)
(map! :leader :desc "Switch Window 2" "2" #'winum-select-window-2)
(map! :leader :desc "Switch Window 3" "3" #'winum-select-window-3)
(map! :leader :desc "Switch Window 4" "4" #'winum-select-window-4)
(map! :leader :desc "Switch Window 5" "5" #'winum-select-window-5)
(map! :leader :desc "Switch Window 6" "6" #'winum-select-window-6)
(map! :leader :desc "Switch Window 7" "7" #'winum-select-window-7)
(map! :leader :desc "Switch Window 8" "8" #'winum-select-window-8)
(map! :leader :desc "Switch Window 9" "9" #'winum-select-window-9)

(map! :leader
      (:prefix ("g" . "git/versions-control")
       :desc "Status" "s" #'magit))

;; Example
;; (map! :leader
;;       (:prefix-map ("a" . "applications")
;;        (:prefix ("j" . "journal")
;;         :desc "New journal entry" "j" #'org-journal-new-entry
;;         :desc "Search journal entry" "s" #'org-journal-search)))

(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (call-interactively #'save-buffer)))

(add-function :after after-focus-change-function
              (lambda () (evil-normal-state)))

(setq server-socket-dir "/tmp/emacs501/")

(modify-syntax-entry ?_ "w")

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t))
