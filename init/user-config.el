;; -*- mode: emacs-lisp -*-

;; -- Contact: rohit507@gmail.com --
;; -- Original Author: ekaschalk@gmail.com --
;;


(defun dotspacemacs/user-config ()
  "Configuration that cannot be delegated to layers."
  (dotspacemacs/user-config/toggles)
  (dotspacemacs/user-config/pandoc)
  (dotspacemacs/user-config/defeat-smartparens)
  (dotspacemacs/user-config/experiments))

(defun dotspacemacs/user-config/pandoc ()
  "Automatically start pandoc mode in every markdown file"
  (add-hook 'markdown-mode-hook 'pandoc-mode))

(defun dotspacemacs/user-config/timestamps ()
  ;; Set the custom time stamps that we use.
  (setq org-time-stamp-custom-formats
        '("<%a %d-%b %Y>" . "<%a %d-%b %Y %H:%M>"))
  (setq-default org-display-custom-times t)

  ;; Bind org-time-stamp to a custom key
  (spacemacs/set-leader-keys-for-major-mode
    'markdown-mode
    "<"
    'markdown-exdent-region)

  (defun md-time-stamp-inactive () (interactive)
         (org-time-stamp-inactive 2))

  (spacemacs/set-leader-keys-for-major-mode
    'markdown-mode
    "."
    'md-time-stamp-inactive)
  (add-hook 'markdown-mode-hook
            (lambda () (interactive) (org-toggle-time-stamp-overlays))))


(defun dotspacemacs/user-config/defeat-smartparens ()
  "Defeat smartparens-mode in evil mode"
  (eval-after-load 'smartparens
    '(progn
       (sp-local-pair 'inferior-python-mode "(" nil :unless nil)
       (sp-local-pair 'inferior-python-mode "[" nil :unless nil)
       (sp-local-pair 'inferior-python-mode "'" nil :unless nil)
       (sp-local-pair 'inferior-python-mode "\"" nil :unless nil)))

  (remove-hook 'prog-mode-hook 'smartparens-mode)
  (add-hook 'evil-insert-state-entry-hook 'turn-off-smartparens-mode)
  (add-hook 'evil-insert-state-exit-hook 'turn-on-smartparens-mode))



(defun dotspacemacs/user-config/toggles ()
  "Spacemacs toggles not intended to be put into layers."
  (spacemacs/toggle-highlight-long-lines-globally-on)
  (spacemacs/toggle-mode-line-minor-modes-off)
  (spacemacs/toggle-aggressive-indent-globally-on)
  (global-highlight-parentheses-mode 1)
  (rainbow-delimiters-mode-enable)
  (fringe-mode '(0 . 8)))

(defun dotspacemacs/user-config/experiments ()
  "Space for trying out configuration updates."
  ;; Nothing atm
  )

  ;; old stuff

  ;; Activate column indicator in prog-mode and text-mode
  ;; (add-hook 'prog-mode-hook 'turn-on-fci-mode)
  ;; (add-hook 'text-mode-hook 'turn-on-fci-mode)
  ;; (setq fci-rule-color "#586e75")

  ;; ;; Enable org's table editor in markdown mode
  ;; (add-hook 'markdown-mode-hook 'turn-on-orgtbl)

  ;; ;; Format for this function from http://ergoemacs.org/emacs/elisp_command_working_on_string_or_region.html
  ;; (defun markdown-fmt-orgtbl (string &optional from to)
  ;;   "Formats Org-mode style tables as GitHub Markdown Tables.
  ;; en called interactively, work on the current paragraph or text selection.
  ;; en called in Lisp code, if STRING is non-nil, returns a changed string.
  ;;  STRING is nil, change the text in the region between positions FROM,  TO."
  ;;   (interactive
  ;;    (if (use-region-p)
  ;;        (list nil (region-beginning) (region-end))
  ;;      (let ((bds (bounds-of-thing-at-point 'paragraph)))
  ;;        (list nil (car bds) (cdr bds)))))
  ;;   (let* ((work-on-string-p (if string t nil))
  ;;          (result (if work-on-string-p
  ;;                      string
  ;;                    (buffer-substring-no-properties from to)))
  ;;          (case-fold-search t)
  ;;          (replace-pairs '(("-|"    . " |")
  ;;                           ("|-"    . "| ")
  ;;                           ("-\\+-" . " | "))))
  ;;     (dolist (pair replace-pairs)
  ;;       (setq result (replace-regexp-in-string (car pair) (cdr pair) result)))
  ;;     (if work-on-string-p
  ;;         result
  ;;       (save-excursion
  ;;         (delete-region from to)
  ;;         (goto-char from)
  ;;         (insert result)))))

  ;; ;; bind table formatter to <SPC> m t
  ;; (spacemacs/set-leader-keys-for-major-mode 'markdown-mode "t" 'markdown-fmt-orgtbl)

  ;; Add support for fira-code and hasklig ligatures.
  ;; (defun my-correct-symbol-bounds (pretty-alist)
  ;;   "Prepend a TAB character to each symbol in this alist,
  ;; is way compose-region called by prettify-symbols-mode
  ;; ll use the correct width of the symbols
  ;; stead of the width measured by char-width."
  ;;   (mapcar (lambda (el)
  ;;             (setcdr el (string ?\t (cdr el)))
  ;;             el)
  ;;           pretty-alist))

  ;; (defun my-ligature-list (ligatures codepoint-start)
  ;;   "Create an alist of strings to replace with
  ;; depoints starting from codepoint-start."
  ;;   (let ((codepoints (-iterate '1+ codepoint-start (length ligatures))))
  ;;     (-zip-pair ligatures codepoints)))

  ;; ; list can be found at https://github.com/i-tu/Hasklig/blob/master/GlyphOrderAndAliasDB#L1588
  ;; (setq my-hasklig-ligatures
  ;;   (let* ((ligs '("&&" "***" "*>" "\\\\" "||" "|>" "::"
  ;;                  "==" "===" "==>" "=>" "=<<" "!!" ">>"
  ;;                  ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
  ;;                  "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
  ;;                  "<<" "<<<" "<+>" ".." "..." "++" "+++"
  ;;                  "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->")))
  ;;     (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

  ;; (setq my-fira-code-ligatures
  ;;       (let* ((ligs '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
  ;;                      "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
  ;;                      "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
  ;;                      "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
  ;;                      ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
  ;;                      "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
  ;;                      "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
  ;;                      "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
  ;;                      ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
  ;;                      "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
  ;;                      "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
  ;;                      "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
  ;;                      "x" ":" "+" "+" "*")))
  ;;         (my-correct-symbol-bounds (my-ligature-list ligs #Xe100))))

  ;; ;; nice glyphs for haskell with hasklig
  ;; (defun my-set-hasklig-ligatures ()
  ;;   "Add hasklig ligatures for use with prettify-symbols-mode."
  ;;   (setq prettify-symbols-alist
  ;;         (append my-hasklig-ligatures prettify-symbols-alist))
  ;;   (prettify-symbols-mode))

  ;; ;; nice glyphs for haskell with fira-code
  ;; (defun my-set-fira-code-ligatures ()
  ;;   "Add fira-code ligatures for use with prettify-symbols-mode."
  ;;   (setq prettify-symbols-alist
  ;;         (append my-fira-code-ligatures prettify-symbols-alist))
  ;;   (prettify-symbols-mode))

  ;; (add-hook 'prog-mode-hook 'my-set-fira-code-ligatures)


  ;;;;; Fira code (old method)
  ;;;; This works when using emacs --daemon + emacsclient
  ;;(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
  ;;;; This works when using emacs without server/client
  ;;(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
  ;;;; I haven't found one statement that makes both of the above situations work, so I use both for now
  ;;(defconst fira-code-font-lock-keywords-alist
  ;;  (mapcar (lambda (regex-char-pair)
  ;;            `(,(car regex-char-pair)
  ;;              (0 (prog1 ()
  ;;                   (compose-region (match-beginning 1)
  ;;                                   (match-end 1)
  ;;                                   ;; The first argument to concat is a string containing a literal tab
  ;;                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
  ;;          '(("\\(www\\)"                   #Xe100)
  ;;            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
  ;;            ("\\(\\*\\*\\*\\)"             #Xe102)
  ;;            ("\\(\\*\\*/\\)"               #Xe103):w
  ;;            ("\\(\\*>\\)"                  #Xe104)
  ;;            ("[^*]\\(\\*/\\)"              #Xe105)
  ;;            ("\\(\\\\\\\\\\)"              #Xe106)
  ;;            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
  ;;            ("\\({-\\)"                    #Xe108)
  ;;            ("\\(\\[\\]\\)"                #Xe109)
  ;;            ("\\(::\\)"                    #Xe10a)
  ;;            ("\\(:::\\)"                   #Xe10b)
  ;;            ("[^=]\\(:=\\)"                #Xe10c)
  ;;            ("\\(!!\\)"                    #Xe10d)
  ;;            ("\\(!=\\)"                    #Xe10e)
  ;;            ("\\(!==\\)"                   #Xe10f)
  ;;            ("\\(-}\\)"                    #Xe110)
  ;;            ("\\(--\\)"                    #Xe111)
  ;;            ("\\(---\\)"                   #Xe112)
  ;;            ("\\(-->\\)"                   #Xe113)
  ;;            ("[^-]\\(->\\)"                #Xe114)
  ;;            ("\\(->>\\)"                   #Xe115)
  ;;            ("\\(-<\\)"                    #Xe116)
  ;;            ("\\(-<<\\)"                   #Xe117)
  ;;            ("\\(-~\\)"                    #Xe118)
  ;;            ("\\(#{\\)"                    #Xe119)
  ;;            ("\\(#\\[\\)"                  #Xe11a)
  ;;            ("\\(##\\)"                    #Xe11b)
  ;;            ("\\(###\\)"                   #Xe11c)
  ;;            ("\\(####\\)"                  #Xe11d)
  ;;            ("\\(#(\\)"                    #Xe11e)
  ;;            ("\\(#\\?\\)"                  #Xe11f)
  ;;            ("\\(#_\\)"                    #Xe120)
  ;;            ("\\(#_(\\)"                   #Xe121)
  ;;            ("\\(\\.-\\)"                  #Xe122)
  ;;            ("\\(\\.=\\)"                  #Xe123)
  ;;            ("\\(\\.\\.\\)"                #Xe124)
  ;;            ("\\(\\.\\.<\\)"               #Xe125)
  ;;            ("\\(\\.\\.\\.\\)"             #Xe126)
  ;;            ("\\(\\?=\\)"                  #Xe127)
  ;;            ("\\(\\?\\?\\)"                #Xe128)
  ;;            ("\\(;;\\)"                    #Xe129)
  ;;            ("\\(/\\*\\)"                  #Xe12a)
  ;;            ("\\(/\\*\\*\\)"               #Xe12b)
  ;;            ("\\(/=\\)"                    #Xe12c)
  ;;            ("\\(/==\\)"                   #Xe12d)
  ;;            ("\\(/>\\)"                    #Xe12e)
  ;;            ("\\(//\\)"                    #Xe12f)
  ;;            ("\\(///\\)"                   #Xe130)
  ;;            ("\\(&&\\)"                    #Xe131)
  ;;            ("\\(||\\)"                    #Xe132)
  ;;            ("\\(||=\\)"                   #Xe133)
  ;;            ("[^|]\\(|=\\)"                #Xe134)
  ;;            ("\\(|>\\)"                    #Xe135)
  ;;            ("\\(\\^=\\)"                  #Xe136)
  ;;            ("\\(\\$>\\)"                  #Xe137)
  ;;            ("\\(\\+\\+\\)"                #Xe138)
  ;;            ("\\(\\+\\+\\+\\)"             #Xe139)
  ;;            ("\\(\\+>\\)"                  #Xe13a)
  ;;            ("\\(=:=\\)"                   #Xe13b)
  ;;            ("[^!/]\\(==\\)[^>]"           #Xe13c)
  ;;            ("\\(===\\)"                   #Xe13d)
  ;;            ("\\(==>\\)"                   #Xe13e)
  ;;            ("[^=]\\(=>\\)"                #Xe13f)
  ;;            ("\\(=>>\\)"                   #Xe140)
  ;;            ("\\(<=\\)"                    #Xe141)
  ;;            ("\\(=<<\\)"                   #Xe142)
  ;;            ("\\(=/=\\)"                   #Xe143)
  ;;            ("\\(>-\\)"                    #Xe144)
  ;;            ("\\(>=\\)"                    #Xe145)
  ;;            ("\\(>=>\\)"                   #Xe146)
  ;;            ("[^-=]\\(>>\\)"               #Xe147)
  ;;            ("\\(>>-\\)"                   #Xe148)
  ;;            ("\\(>>=\\)"                   #Xe149)
  ;;            ("\\(>>>\\)"                   #Xe14a)
  ;;            ("\\(<\\*\\)"                  #Xe14b)
  ;;            ("\\(<\\*>\\)"                 #Xe14c)
  ;;            ("\\(<|\\)"                    #Xe14d)
  ;;            ("\\(<|>\\)"                   #Xe14e)
  ;;            ("\\(<\\$\\)"                  #Xe14f)
  ;;            ("\\(<\\$>\\)"                 #Xe150)
  ;;            ("\\(<!--\\)"                  #Xe151)
  ;;            ("\\(<-\\)"                    #Xe152)
  ;;            ("\\(<--\\)"                   #Xe153)
  ;;            ("\\(<->\\)"                   #Xe154)
  ;;            ("\\(<\\+\\)"                  #Xe155)
  ;;            ("\\(<\\+>\\)"                 #Xe156)
  ;;            ("\\(<=\\)"                    #Xe157)
  ;;            ("\\(<==\\)"                   #Xe158)
  ;;            ("\\(<=>\\)"                   #Xe159)
  ;;            ("\\(<=<\\)"                   #Xe15a)
  ;;            ("\\(<>\\)"                    #Xe15b)
  ;;            ("[^-=]\\(<<\\)"               #Xe15c)
  ;;            ("\\(<<-\\)"                   #Xe15d)
  ;;            ("\\(<<=\\)"                   #Xe15e)
  ;;            ("\\(<<<\\)"                   #Xe15f)
  ;;            ("\\(<~\\)"                    #Xe160)
  ;;            ("\\(<~~\\)"                   #Xe161)
  ;;            ("\\(</\\)"                    #Xe162)
  ;;            ("\\(</>\\)"                   #Xe163)
  ;;            ("\\(~@\\)"                    #Xe164)
  ;;            ("\\(~-\\)"                    #Xe165)
  ;;            ("\\(~=\\)"                    #Xe166)
  ;;            ("\\(~>\\)"                    #Xe167)
  ;;            ("[^<]\\(~~\\)"                #Xe168)
  ;;            ("\\(~~>\\)"                   #Xe169)
  ;;            ("\\(%%\\)"                    #Xe16a)
  ;;           ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
  ;;            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
  ;;            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
  ;;            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))
  ;;
  ;;(defun add-fira-code-symbol-keywords ()
  ;;  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))
  ;;
  ;;(add-hook 'prog-mode-hook
  ;;          #'add-fira-code-symbol-keywords)
