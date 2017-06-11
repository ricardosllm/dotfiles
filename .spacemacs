;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip nil
                      auto-completion-enable-sort-by-usage t
                      auto-completion-private-snippets-directory "~/d/dotfiles/snippets")
     helm
     ;; auto-completion
     ;; better-defaults
     colors
     better-defaults
     emacs-lisp
     sql
     vimscript
     python
     shell-scripts
     csv
     osx
     git
     github
     markdown
     org
     search-engine
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     (version-control :variables
                      version-control-global-margin t
                      version-control-diff-tool 'diff-hl)

     ;; languages
     clojure
     javascript
     yaml
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-enable-ruby-on-rails-support t)
     html
     lua

     ;; frameworks
     ;; salt
     ansible
     ruby-on-rails
     ;; dockerfile

     ;; tools
     dash
     evernote
     gtags

     ;; motion
     ;; evil-cleverparens

     ;; generic
     themes-megapack
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         gruvbox
                         monokai
                         spacemacs-dark
                         zenburn
                         brin
                         wilson
                         spacemacs-light
                         sanityinc-solarized-light
                         sanityinc-solarized-dark
                         leuven
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq-default
   require-final-newline t
   flycheck-disabled-checkers '(ruby-rubylint)
   js2-basic-offset 2
   js-indent-level 2
   powerline-default-separator 'arrow
   spaceline-minor-modes-p nil
   hybrid-mode-enable-hjkl-bindings t
   tab-width 2
   ruby-insert-encoding-magic-comment nil
   )

  (spaceline-compile)

  (diff-hl-flydiff-mode)

  (add-hook 'focus-out-hook
            (defun save-current-buffer-if-needed ()
              (interactive)
              (when (and (buffer-file-name) (buffer-modified-p))
                (save-buffer))))

  ;; Ruby
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))

  ;; Haml
  (add-hook 'haml-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'haml-mode-hook #'(lambda () (modify-syntax-entry ?: "w")))
  (add-hook 'haml-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  (add-hook 'haml-mode-hook #'(lambda () (modify-syntax-entry ?? "w")))
  (add-hook 'haml-mode-hook #'(lambda () (modify-syntax-entry ?! "w")))

  (add-hook 'yaml-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'json-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

  ;; Clojure
  (with-eval-after-load 'clojure-mode
    (dolist (c (string-to-list ":_-?!#*"))
      (modify-syntax-entry c "w" clojure-mode-syntax-table )))

  (add-hook 'clojure-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'clojure-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  (add-hook 'clojure-mode-hook #'(lambda () (modify-syntax-entry ?< "w")))
  (add-hook 'clojure-mode-hook #'(lambda () (modify-syntax-entry ?> "w")))
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

  ;; Clojurescript
  (with-eval-after-load 'clojurescript-mode
    (dolist (c (string-to-list ":_-?!#*"))
      (modify-syntax-entry c "w" clojurescript-mode-syntax-table )))

  (add-hook 'clojurescript-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'clojurescript-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  (add-hook 'clojurescript-mode-hook #'(lambda () (modify-syntax-entry ?< "w")))
  (add-hook 'clojurescript-mode-hook #'(lambda () (modify-syntax-entry ?> "w")))

  ;; After save hooks
  (add-hook 'after-save-hook 'evil-escape)

  ;; Movements
  (global-set-key (kbd "<s-right>") 'move-end-of-line)
  (global-set-key (kbd "<s-left>") 'move-beginning-of-line)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "j" 'paredit-join-sexps)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "o" 'paredit-split-sexp)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "w" 'paredit-wrap-sexp)
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "S" 'paredit-splice-sexp)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "j" 'paredit-join-sexps)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "o" 'paredit-split-sexp)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "w" 'paredit-wrap-sexp)
  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "S" 'paredit-splice-sexp)

  ;; Org mode
  (setq org-export-with-sub-superscripts nil)

  (spacemacs/toggle-smartparens-on)

  ;; Hoplon
  (add-to-list 'auto-mode-alist '("\\.cljs\\.hl\\'" . clojurescript-mode))
  (add-hook 'clojure-mode-hook
            '(lambda ()
               ;; Hoplon functions and macros
               (dolist (pair '((page . 'defun)
                               (loop-tpl . 'defun)
                               (if-tpl . '1)
                               (for-tpl . '1)
                               (case-tpl . '1)
                               (cond-tpl . 'defun)))
                 (put-clojure-indent (car pair)
                                     (car (last pair))))))

  (require 'whitespace)
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face lines-tail))

  (add-hook 'prog-mode-hook 'whitespace-mode)
  
  ;; Python
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  (pyenv-mode)
  (setq-default dotspacemacs-configuration-layers
                '((python :variables python-test-runner 'nose)))
  (setq-default dotspacemacs-configuration-layers
                '((python :variables python-enable-yapf-format-on-save t)))
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "486759384769d44b22bb46072726c2cfb3ccc3d49342e5af1854784d505ffc01" "28130127bbf3072c1bbc7652fca7245f186bb417b3b385a5e4da57b895ffe9d8" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "2bed8550c6f0a5ce635373176d5f0e079fb4fb5919005bfa743c71b5eed29d81" "8453c6ba2504874309bdfcda0a69236814cefb860a528eb978b5489422cb1791" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "d556133e0ac43cffe61eb16229d1a36c9ae9c81400943fd8de153ec5afe89ecb" "44eec3c3e6e673c0d41b523a67b64c43b6e38f8879a7969f306604dcf908832c" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "66132890ee1f884b4f8e901f0c61c5ed078809626a547dbefbb201f900d03fd8" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" "95db78d85e3c0e735da28af774dfa59308db832f84b8a2287586f5b4f21a7a5b" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "05411251e1232959144334e4359f8af0931c6c1a2f3a109d0d9e6753b6dfecfe" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (winum unfill solarized-theme madhat2r-theme fuzzy company-ansible rainbow-mode rainbow-identifiers mwim magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht color-identifiers-mode sql-indent pdf-tools tablist evil-cleverparens vimrc-mode dactyl-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic yaml-mode powerline rake pcre2el org alert log4e gntp mmm-mode minitest markdown-mode skewer-mode simple-httpd json-snatcher json-reformat js2-mode insert-shebang parent-mode hide-comnt projectile request haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter flx magit magit-popup git-commit with-editor smartparens iedit anzu evil goto-chg undo-tree diminish web-completion-data dash-functional tern company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl inf-ruby bind-map bind-key yasnippet packed f dash s helm avy helm-core async auto-complete popup package-build pos-tip flycheck fish-mode company-shell csv-mode zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode salt-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-delimiters railscasts-theme quelpa purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono- heme persp-mode pbcopy pastels-on-dark-theme paradox osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lua-mode lorem-ipsum livid-mode linum-relative link-hint light-soap-theme less-css-mode launchctl json-mode js2-refactor js-doc jinja2-mode jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags geeknote gandalf-theme flyspell-correct-helm flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diff-hl dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web company-tern company-statistics column-enforce-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clojure-snippets clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ansible-doc ansible ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values (quote ((projectile-project-type . rails-rspec))))
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "nil" :slant normal :weight normal :height 150 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
