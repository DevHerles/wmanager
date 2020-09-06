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
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     erlang
     csv
     ;; haskell
     latex
     python
     lua
     php
     markdown
     vimscript
     yaml
     javascript
     spotify
     (c-c++ :variables c-c++-enable-clang-support t)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     ;; java
     ;; better-defaults
     emacs-lisp
     git
     react
     ;; markdown
     (org :variables
          org-enable-bootstrap-support t)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ag
                                      find-file-in-project
                                      evil-easymotion
                                      ;; meghanada
                                      groovy-mode
                                      gradle-mode
                                      kotlin-mode
                                      import-js
                                      expand-region

                                      graphql-mode

                                      ;; Themes
                                      color-theme-sanityinc-tomorrow
                                      atom-one-dark-theme
                                      doom-themes
                                      gruvbox-theme

                                      ;; LaTeX
                                      latex-preview-pane

                                      ;; Clipboard
                                      xclip
                                      )

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
   dotspacemacs-check-for-update nil
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
   dotspacemacs-themes '(doom-one
                         gruvbox-dark-medium
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
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
   dotspacemacs-distinguish-gui-tab nil
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
   dotspacemacs-auto-resume-layouts nil
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
   dotspacemacs-fullscreen-use-non-native nil
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
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
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
   dotspacemacs-whitespace-cleanup nil
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

  ;; (with-eval-after-load 'org
  ;;   (progn
  ;;     (org-babel-tangle-file "~/.spacemacs.d/configuration.org" "~/.spacemacs.d/configuration.el" "elisp")
  ;;     (load-file "~/.spacemacs.d/configuration.el")))
  ;; (org-babel-load-file (expand-file-name "~/.spacemacs.d/configuration.org"))

  ;; Projectile
  ;; (define-key evil-normal-state-map (kbd "SPC p") 'helm-projectile)

  ;; Avy
  avy-all-windows 'all-frames

  ;; Bind leader-s to 'easymotion',
  ;; but also unbind leader-s-h from auto-highlight-symbol
  ;; (with-eval-after-load 'auto-highlight-symbol
  (evil-leader/set-key
    "s" 'evil-avy-goto-char)


  ;; Scroll wheel
  (setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two lines at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

  ;; Leader
  (evil-leader/set-key
    "p" 'helm-projectile
    "P" 'helm-projectile-switch-project)

  ;; Backup and auto save files
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))

  ;; Neotree
  (with-eval-after-load 'neotree
    (define-key neotree-mode-map (kbd "<backspace>") 'neotree-toggle)
    (define-key neotree-mode-map (kbd "DEL") 'neotree-toggle)
    (define-key neotree-mode-map (kbd "o") 'neotree-enter)
    (define-key neotree-mode-map (kbd "O") 'neotree-quick-look)
    (define-key neotree-mode-map (kbd "r") 'neotree-refresh)
    (define-key neotree-mode-map (kbd "s") 'neotree-enter-vertical-split)
    (define-key neotree-mode-map (kbd "i") 'neotree-enter-horizontal-split)
    (define-key neotree-mode-map (kbd "I") 'neotree-hidden-file-toggle)
    (define-key neotree-mode-map (kbd "RET") 'neotree-enter))

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))

  (define-key evil-normal-state-map (kbd "S-<backspace>") 'neotree-toggle)
  (define-key evil-normal-state-map (kbd "<backspace>") 'neotree-project-dir)
  (define-key evil-normal-state-map (kbd "DEL") 'neotree-project-dir)

  ;; Themes & Style

  (load-theme 'doom-one t)

  (setq-default
   standard-indent 2
   tab-width 2
   indent-tabs-mode nil)

  ;; Case labels should be indented
  (c-set-offset 'case-label '+)

  (c-add-style "mystyle"
               '((c-basic-offset . 2)
                 (c-offsets-alist
                  (defun-open . 0)
                  (substatement-open . 0))))

  (setq c-default-style "mystyle")


  ;; Org mode
  (setq org-src-tab-acts-natively t)
  (setq org-use-sub-superscripts '{})
  (setq org-export-with-sub-superscripts '{})
  (setq org-latex-caption-above nil)

  ;; Language-specific variables

  ;; LAU
  (add-to-list 'auto-mode-alist '("\\.lau\\'" . lua-mode))

  ;; Javascript
  (setq-default
   js-indent-level 2
   js2-basic-offset 2
   js2-strict-semi-warning nil
   js2-missing-semi-one-line-override nil
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   web-mode-indent-style 2)

  ;; ;; Java
  ;; (setq eclim-eclipse-dirs '("/usr/lib/eclipse")
  ;;       eclim-executable "/usr/lib/eclipse/eclimd")

  ;; Assembly ARM
  ;; (setq asm-comment-char ?\;)

  ;; Browser
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "xdg-open")

  ;; Fun utilities
  (defun calc-eval-region (beg end)
    "Eval the arithmetic expression in the region and replace it with the result"
    (interactive "r")
    (let ((val (calc-eval (buffer-substring beg end))))
      (delete-region beg end)
      (insert val)))

  ;; UTF-8 as default encoding
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)

  ;; Sort JS imports
  (defun sort-js-imports ()
    (interactive)
    (sort-js-imports-region nil (point-min) (get-end-of-js-import))
    )

  (defun get-end-of-js-import ()
    (save-excursion
      (goto-char (point-max))
      (search-backward-regexp "import")
      (word-search-forward "from" nil t)
      (line-end-position)
      )
    )

  (defun sort-js-imports-region (reverse beg end)
    (interactive "P\nr")
    (save-excursion
      (save-restriction
        (narrow-to-region beg end)
        (goto-char (point-min))
        (let ;; To make `end-of-line' and etc. to ignore fields.
            ((inhibit-field-text-motion t))
          (sort-subr reverse
                     'forward-line
                     (lambda () (search-forward "from" nil t) (end-of-line))
                     (lambda ()
                       (let (
                             (skip-amount (save-excursion (search-forward "from" nil t)))
                             (skip-amount-end (line-end-position))
                             )
                         (cons skip-amount skip-amount-end)
                         )
                       )
                     nil
                     (lambda (a b)
                       (let ((s1 (buffer-substring (car a) (cdr a)))
                             (s2 (buffer-substring (car b) (cdr b))))
                         (message (format "[%s] [%s] [%s] [%s] [%s]\n" s1 s2 a b (calculate-string-priority s1 s2)))
                         (calculate-string-priority s1 s2)
                       )
                     ))))))

  (defun calculate-string-priority (s1 s2)
    (< (+ (calculate-js-import-priority s1) (if (string< s1 s2) -1 1)) (calculate-js-import-priority s2)))

  (defun calculate-js-import-priority (import)
    (catch 'val
      (cond
       ((> (or (string-match "lodash" import) -2) -1) (throw 'val 0))
       ((> (or (string-match "\"react\"" import) -2) -1) (throw 'val 10))
       ((> (or (string-match "\"react" import) -2) -1) (throw 'val 11))
       ((> (or (string-match "\@.*\"" import) -2) -1) (throw 'val 20))
       ((> (or (string-match "/imports/ui/" import) -2) -1) (throw 'val 30))
       ((> (or (string-match "/imports/helpers/" import) -2) -1) (throw 'val 40))
       ((> (or (string-match "/imports/api/" import) -2) -1) (throw 'val 50))
       ((> (or (string-match "scss" import) -2) -1) (throw 'val 100))
       ((> (or (string-match "../" import) -2) -1) (throw 'val 110))
       (t (throw 'val 20)))
      )
    )

  (setq auto-save-file-name-transforms
        `((".*" ,(concat user-emacs-directory "auto-save/") t))) 

  (setq backup-directory-alist
        `(("." . ,(expand-file-name
                   (concat user-emacs-directory "backups")))))

  (defun md407/connect ()
    "Connect to the MD407 if no connection is already made"
    (unless (get-process "md407")
      (let ((port (read-file-name "Port: " "/dev/")))
        (make-serial-process :port port
                             :speed 115200
                             :name "md407"
                             :buffer "*md407-serial-output*"))))

  (defun md407/load-file (file-path)
    "Load .s19 file to the MD407"
    (let ((s19-text (with-temp-buffer (insert-file-contents file-path)
                                      (buffer-string))))
      (md407/connect)
      (process-send-string "md407" (concat "load\n" s19-text)))
    (message "%s loaded" file-path))

  (defun md407/go ()
    "Send <go> command to the MD407"
    (process-send-string "md407" "go\n")
    (message "<go> command sent!"))


  ;; TODO: Rewrite reading output from serial connection instead of
  ;;       waiting an aribtrary time.
  (defun md407/load-and-go ()
    "Convenience function to load and run an s19 file to the MD407"
    (interactive)
    (let ((s19-file (path-to-s19-file)))
      (if (not s19-file)
          (message "Could not find .s19 file. Is this a Rust project?")
        (md407/load-file s19-file)
        (sit-for 0.1)
        (md407/go))))

  (defun paths-to-root (path)
    "Return list of paths from given path to root"
    (let ((path-parts (split-string path "/" t))
          (result '("/")))
      (dolist (element path-parts result)
        (setq result (cons (concat (car result) element "/") result)))))

  (defun find-cargo-toml ()
    "Return path in this or any of the parent directories which contains
Cargo.toml, nil if not found anywhere."
    (let ((paths (paths-to-root (file-name-directory buffer-file-name))))
      (while (and paths (not (file-exists-p (concat (car paths) "/Cargo.toml"))))
        (setq paths (cdr paths)))
      (car paths)))

  ;; TODO: Check for existence of file at provided path!
  (defun get-key (path key)
    "Get the name of a Rust crate as specified in its Cargo.toml"
    (with-temp-buffer (insert-file-contents path)
                      (re-search-forward (concat key "[[:space:]]*=[[:space:]]*\""))
                      (current-word)))

  (defun path-to-s19-file ()
    (interactive)
    (let ((base (find-cargo-toml)))
      (when base
        (let ((name (get-key (concat base "Cargo.toml") "name"))
              (target (get-key (concat base ".cargo/config") "target")))
          (if target
              (concat base "target/" target "/release/" name ".s19")
            (message "Could not open .cargo/config"))))))

  (defvar md407-mode-map
    (let ((map (make-sparse-keymap)))
      (define-key map "<f6" 'md407/load-and-go)
      map)
    "Keymap used in md407-mode")

  (define-minor-mode md407-mode
    "Easy compilation and loading of C and Rust code onto the MD407"
    :lighter " MD407"
    :keymap md407-mode-map)
                                        ;  :keymap `((,(kbd "<f6>") . '(md407/load-and-go))))


  ;; LaTeX
  (setq tex-fontify-script nil)
  (setq font-latex-fontify-script nil)

  (eval-after-load "tex-mode" '(fset 'tex-font-lock-suscript 'ignore))

  ;; Clipboard
  (xclip-mode t)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erlang-indent-level 2)
 '(evil-want-Y-yank-to-eol nil)
 '(magit-todos-mode t)
 '(org-agenda-files (quote ("~/Documents/Schoolwork/DigDesign/report.org")))
 '(package-selected-packages
   (quote
    (erlang xclip csv-mode intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode graphql graphql-mode helm-spotify-plus spotify multi kotlin-mode company-emacs-eclim eclim auto-complete-auctex company-auctex auctex-latexmk auctex latex-preview-pane yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic lua-mode import-js grizzl phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode color-theme-sanityinc-tomorrow gruvbox-theme autothemer mmm-mode markdown-toc markdown-mode gh-md ox-twbs org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot disaster company-c-headers cmake-mode clang-format ivy ag jdee groovy-mode gradle-mode meghanada flycheck-pos-tip pos-tip flycheck evil-easymotion vimrc-mode dactyl-mode yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode doom-themes all-the-icons memoize font-lock+ atom-one-dark-theme find-file-in-project smeargle orgit magit-gitflow helm-gitignore helm-company helm-c-yasnippet gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy evil-magit magit magit-popup git-commit ghub let-alist with-editor company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values (quote ((eval progn (pp-buffer) (indent-buffer))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
