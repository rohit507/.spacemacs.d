;; -*- mode: emacs-lisp -*-

;; -- Contact: rohit507@gmail.com --
;; -- Original Author: ekaschalk@gmail.com --
;; -- MIT License --
;; -- Emacs 25.3.2 ~ Spacemacs Dev Branch 0.300.0.x ~ pkgs updated: 05/06/18 --
;;
;; All configuration is housed in personal layers - see README.
;; `init.el' configures spacemacs, defining required `dotspacemacs/...' functions.


(defvar linux? (eq system-type 'gnu/linux)
  "Are we on a gnu/linux machine?")

(defun os-path (path)
  "Prepend drive label to PATH if on windows machine."
  (if linux?
      path
    (expand-file-name path "c:")))

;; dotspacemacs/init and all the default configuration variables are stored in
;; this file. This is where you change things like fonts, display settings, and
;; the like
(load "~/.spacemacs.d/init/config")

;; dotspacemacs/layers declarations are all in this file
(load "~/.spacemacs.d/init/layers")

;; dotspacemacs/user-config is defined here
(load "~/.spacemacs.d/init/user-config")

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
   It is called immediately after `dotspacemacs/init', before layer configuration
   executes.
   This function is mostly useful for variables that need to be set
   before packages are loaded. If you are unsure, you should try in setting them in
   `dotspacemacs/user-config' first.
   Package independent settings to run before `dotspacemacs/user-config'."

  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yapfify yaml-mode xterm-color wgrep web-mode web-beautify vagrant-tramp vagrant unfill toml-mode tagedit smex smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pandoc-mode ox-pandoc orgit org-ref pdf-tools key-chord tablist org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim multi-term mmm-mode minitest markdown-toc magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc ivy-hydra intero insert-shebang hy-mode htmlize hlint-refactor hindent helm-bibtex parsebib haskell-snippets haml-mode graphviz-dot-mode gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md fuzzy flyspell-correct-ivy flyspell-correct flycheck-rust flycheck-pos-tip pos-tip flycheck-haskell flycheck fish-mode evil-magit magit magit-popup git-commit ghub with-editor eshell-z eshell-prompt-extras esh-help emmet-mode disaster diff-hl cython-mode csv-mode counsel-projectile counsel swiper ivy company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-ghci company-ghc ghc haskell-mode company-cabal company-c-headers company-auctex company-anaconda company coffee-mode cmm-mode cmake-mode clang-format chruby cargo markdown-mode rust-mode bundler inf-ruby biblio biblio-core auto-yasnippet yasnippet auto-dictionary auctex anaconda-mode pythonic ac-ispell auto-complete zenburn-theme ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline solarized-theme restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
