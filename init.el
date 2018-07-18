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
    (powerline pcre2el spinner pdf-tools key-chord tablist org-category-capture alert log4e gntp org-plus-contrib skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode hydra htmlize parent-mode helm-bibtex parsebib helm helm-core haml-mode fringe-helper git-gutter+ git-gutter gh marshal logito pcache ht flyspell-correct pos-tip flycheck flx magit magit-popup git-commit ghub let-alist with-editor smartparens iedit anzu evil goto-chg undo-tree highlight projectile pkg-info epl counsel swiper web-completion-data dash-functional tern ghc haskell-mode company markdown-mode rust-mode inf-ruby bind-map bind-key biblio biblio-core yasnippet packed auctex async anaconda-mode pythonic f s ivy all-the-icons memoize avy auto-complete popup helm-themes helm-swoop helm-projectile helm-mode-manager helm-flx helm-descbinds helm-ag ace-jump-helm-line yapfify yaml-mode xterm-color ws-butler winum which-key wgrep web-mode web-beautify volatile-highlights vi-tilde-fringe vagrant-tramp vagrant uuidgen use-package unfill toml-mode toc-org tagedit spaceline solarized-theme smex smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs request rbenv ranger rake rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode pretty-mode prettify-utils popwin pip-requirements persp-mode paradox pandoc-mode ox-pandoc orgit org-ref org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file nord-theme neotree mwim multi-term move-text mmm-mode minitest markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc ivy-hydra intero insert-shebang indent-guide ibuffer-projectile hy-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-make haskell-snippets graphviz-dot-mode google-translate golden-ratio gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy flyspell-correct-ivy flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido fish-mode fill-column-indicator fancy-battery faceup eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump disaster diminish diff-hl define-word cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-shell company-ghci company-ghc company-cabal company-c-headers company-auctex company-anaconda column-enforce-mode coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format chruby cargo bundler auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons-ivy all-the-icons-dired aggressive-indent adaptive-wrap ace-window ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org symon string-inflection spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el password-generator paradox spinner overseer org-plus-contrib org-bullets open-junk-file neotree nameless move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav editorconfig dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
