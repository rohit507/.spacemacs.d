(require 'dash)

(provide 'pretty-fonts)

;;; API

;;;###autoload
(defun pretty-fonts-set-fontsets (CODE-FONT-ALIST)
  "Utility to associate many unicode points with specified fonts."
  (--each CODE-FONT-ALIST
    (-let (((font . codes) it))
      (--each codes
        (set-fontset-font nil `(,it . ,it) font)
        (set-fontset-font t `(,it . ,it) font)))))

;;;###autoload
(defun pretty-fonts--add-kwds (FONT-LOCK-ALIST)
  "Exploits `font-lock-add-keywords' to apply regex-unicode replacements."
  (font-lock-add-keywords
   nil (--map (-let (((rgx uni-point) it))
               `(,rgx (0 (progn
                           (compose-region
                            (match-beginning 1) (match-end 1)
                            ,(concat "\t" (list uni-point)))
                           nil))))
             FONT-LOCK-ALIST)))

;;;###autoload
(defmacro pretty-fonts-set-kwds (FONT-LOCK-HOOKS-ALIST)
  "Set regex-unicode replacements to many modes."
  `(--each ,FONT-LOCK-HOOKS-ALIST
     (-let (((font-locks . mode-hooks) it))
       (--each mode-hooks
         (add-hook it (-partial 'pretty-fonts--add-kwds
                                (symbol-value font-locks)))))))

;;; Fira Font

(defconst pretty-fonts-fira-font
  '(;; OPERATORS  ;; We use this format instead of the old one because it has a better order
    ("\\(www\\)"                   #Xe100)
    ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
    ("\\(\\*\\*\\*\\)"             #Xe102)
    ("\\(\\*\\*/\\)"               #Xe103)
    ("\\(\\*>\\)"                  #Xe104)
    ("[^*]\\(\\*/\\)"              #Xe105)
    ("\\(\\\\\\\\\\)"              #Xe106)
    ("\\(\\\\\\\\\\\\\\)"          #Xe107)
    ("\\({-\\)"                    #Xe108)
    ("\\(\\[\\]\\)"                #Xe109)
    ("\\(::\\)"                    #Xe10a)
    ("\\(:::\\)"                   #Xe10b)
    ("[^=]\\(:=\\)"                #Xe10c)
    ("\\(!!\\)"                    #Xe10d)
    ("\\(!=\\)"                    #Xe10e)
    ("\\(!==\\)"                   #Xe10f)
    ("\\(-}\\)"                    #Xe110)
    ("\\(--\\)"                    #Xe111)
    ("\\(---\\)"                   #Xe112)
    ("\\(-->\\)"                   #Xe113)
    ("[^-]\\(->\\)"                #Xe114)
    ("\\(->>\\)"                   #Xe115)
    ("\\(-<\\)"                    #Xe116)
    ("\\(-<<\\)"                   #Xe117)
    ("\\(-~\\)"                    #Xe118)
    ("\\(#{\\)"                    #Xe119)
    ("\\(#\\[\\)"                  #Xe11a)
    ("\\(##\\)"                    #Xe11b)
    ("\\(###\\)"                   #Xe11c)
    ("\\(####\\)"                  #Xe11d)
    ("\\(#(\\)"                    #Xe11e)
    ("\\(#\\?\\)"                  #Xe11f)
    ("\\(#_\\)"                    #Xe120)
    ("\\(#_(\\)"                   #Xe121)
    ("\\(\\.-\\)"                  #Xe122)
    ("\\(\\.=\\)"                  #Xe123)
    ("\\(\\.\\.\\)"                #Xe124)
    ("\\(\\.\\.<\\)"               #Xe125)
    ("\\(\\.\\.\\.\\)"             #Xe126)
    ("\\(\\?=\\)"                  #Xe127)
    ("\\(\\?\\?\\)"                #Xe128)
    ("\\(;;\\)"                    #Xe129)
    ("\\(/\\*\\)"                  #Xe12a)
    ("\\(/\\*\\*\\)"               #Xe12b)
    ("\\(/=\\)"                    #Xe12c)
    ("\\(/==\\)"                   #Xe12d)
    ("\\(/>\\)"                    #Xe12e)
    ("\\(//\\)"                    #Xe12f)
    ("\\(///\\)"                   #Xe130)
    ("\\(&&\\)"                    #Xe131)
    ("\\(||\\)"                    #Xe132)
    ("\\(||=\\)"                   #Xe133)
    ("[^|]\\(|=\\)"                #Xe134)
    ("\\(|>\\)"                    #Xe135)
    ("\\(\\^=\\)"                  #Xe136)
    ("\\(\\$>\\)"                  #Xe137)
    ("\\(\\+\\+\\)"                #Xe138)
    ("\\(\\+\\+\\+\\)"             #Xe139)
    ("\\(\\+>\\)"                  #Xe13a)
    ("\\(=:=\\)"                   #Xe13b)
    ("[^!/]\\(==\\)[^>]"           #Xe13c)
    ("\\(===\\)"                   #Xe13d)
    ("\\(==>\\)"                   #Xe13e)
    ("[^=]\\(=>\\)"                #Xe13f)
    ("\\(=>>\\)"                   #Xe140)
    ("\\(<=\\)"                    #Xe141)
    ("\\(=<<\\)"                   #Xe142)
    ("\\(=/=\\)"                   #Xe143)
    ("\\(>-\\)"                    #Xe144)
    ("\\(>=\\)"                    #Xe145)
    ("\\(>=>\\)"                   #Xe146)
    ("[^-=]\\(>>\\)"               #Xe147)
    ("\\(>>-\\)"                   #Xe148)
    ("\\(>>=\\)"                   #Xe149)
    ("\\(>>>\\)"                   #Xe14a)
    ("\\(<\\*\\)"                  #Xe14b)
    ("\\(<\\*>\\)"                 #Xe14c)
    ("\\(<|\\)"                    #Xe14d)
    ("\\(<|>\\)"                   #Xe14e)
    ("\\(<\\$\\)"                  #Xe14f)
    ("\\(<\\$>\\)"                 #Xe150)
    ("\\(<!--\\)"                  #Xe151)
    ("\\(<-\\)"                    #Xe152)
    ("\\(<--\\)"                   #Xe153)
    ("\\(<->\\)"                   #Xe154)
    ("\\(<\\+\\)"                  #Xe155)
    ("\\(<\\+>\\)"                 #Xe156)
    ("\\(<=\\)"                    #Xe157)
    ("\\(<==\\)"                   #Xe158)
    ("\\(<=>\\)"                   #Xe159)
    ("\\(<=<\\)"                   #Xe15a)
    ("\\(<>\\)"                    #Xe15b)
    ("[^-=]\\(<<\\)"               #Xe15c)
    ("\\(<<-\\)"                   #Xe15d)
    ("\\(<<=\\)"                   #Xe15e)
    ("\\(<<<\\)"                   #Xe15f)
    ("\\(<~\\)"                    #Xe160)
    ("\\(<~~\\)"                   #Xe161)
    ("\\(</\\)"                    #Xe162)
    ("\\(</>\\)"                   #Xe163)
    ("\\(~@\\)"                    #Xe164)
    ("\\(~-\\)"                    #Xe165)
    ("\\(~=\\)"                    #Xe166)
    ("\\(~>\\)"                    #Xe167)
    ("[^<]\\(~~\\)"                #Xe168)
    ("\\(~~>\\)"                   #Xe169)
    ("\\(%%\\)"                    #Xe16a)
    ; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
    ("[^:=]\\(:\\)[^:=]"           #Xe16c)
    ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
    ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f)

    ; ;; Pipes
    ; ("\\(<|\\)" #Xe14d) ("\\(<>\\)" #Xe15b) ("\\(<|>\\)" #Xe14e) ("\\(|>\\)" #Xe135)

    ; ;; Brackets
    ; ("\\(<\\*\\)" #Xe14b) ("\\(<\\*>\\)" #Xe14c) ("\\(\\*>\\)" #Xe104)
    ; ("\\(<\\$\\)" #Xe14f) ("\\(<\\$>\\)" #Xe150) ("\\(\\$>\\)" #Xe137)
    ; ("\\(<\\+\\)" #Xe155) ("\\(<\\+>\\)" #Xe156) ("\\(\\+>\\)" #Xe13a)

    ; ;; Equality
    ; ("\\(!=\\)" #Xe10e) ("\\(!==\\)"         #Xe10f) ("\\(=/=\\)" #Xe143)
    ; ("\\(/=\\)" #Xe12c) ("\\(/==\\)"         #Xe12d)
    ; ("\\(===\\)"#Xe13d) ("[^!/]\\(==\\)[^>]" #Xe13c)

    ; ;; Equality Special
    ; ("\\(||=\\)"  #Xe133) ("[^|]\\(|=\\)" #Xe134)
    ; ("\\(~=\\)"   #Xe166)
    ; ("\\(\\^=\\)" #Xe136)
    ; ("\\(=:=\\)"  #Xe13b)

    ; ;; Comparisons
    ; ("\\(<=\\)" #Xe141) ("\\(>=\\)" #Xe145)
    ; ("\\(</\\)" #Xe162) ("\\(</>\\)" #Xe163)

    ; ;; Shifts
    ; ("[^-=]\\(>>\\)" #Xe147) ("\\(>>>\\)" #Xe14a)
    ; ("[^-=]\\(<<\\)" #Xe15c) ("\\(<<<\\)" #Xe15f)

    ; ;; Dots
    ; ("\\(\\.-\\)"    #Xe122) ("\\(\\.=\\)" #Xe123)
    ; ("\\(\\.\\.<\\)" #Xe125)

    ; ;; Hashes
    ; ("\\(#{\\)"  #Xe119) ("\\(#(\\)"   #Xe11e) ("\\(#_\\)"   #Xe120)
    ; ("\\(#_(\\)" #Xe121) ("\\(#\\?\\)" #Xe11f) ("\\(#\\[\\)" #Xe11a)

    ; ;; REPEATED CHARACTERS
    ; ;; 2-Repeats
    ; ("\\(||\\)" #Xe132)
    ; ("\\(!!\\)" #Xe10d)
    ; ("\\(%%\\)" #Xe16a)
    ; ("\\(&&\\)" #Xe131)

    ; ;; 2+3-Repeats
    ; ("\\(##\\)"       #Xe11b) ("\\(###\\)"         #Xe11c) ("\\(####\\)" #Xe11d)
    ; ("\\(--\\)"       #Xe111) ("\\(---\\)"         #Xe112)
    ; ("\\({-\\)"       #Xe108) ("\\(-}\\)"          #Xe110)
    ; ("\\(\\\\\\\\\\)" #Xe106) ("\\(\\\\\\\\\\\\\\)" #Xe107)
    ; ("\\(\\.\\.\\)"   #Xe124) ("\\(\\.\\.\\.\\)"   #Xe126)
    ; ("\\(\\+\\+\\)"   #Xe138) ("\\(\\+\\+\\+\\)"   #Xe139)
    ; ("\\(//\\)"       #Xe12f) ("\\(///\\)"         #Xe130)
    ; ("\\(::\\)"       #Xe10a) ("\\(:::\\)"         #Xe10b)

    ; ;; ARROWS
    ; ;; Direct
    ; ("[^-]\\(->\\)" #Xe114) ("[^=]\\(=>\\)" #Xe13f)
    ; ("\\(<-\\)"     #Xe152)
    ; ("\\(-->\\)"    #Xe113) ("\\(->>\\)"    #Xe115)
    ; ("\\(==>\\)"    #Xe13e) ("\\(=>>\\)"    #Xe140)
    ; ("\\(<--\\)"    #Xe153) ("\\(<<-\\)"    #Xe15d)
    ; ("\\(<==\\)"    #Xe158) ("\\(<<=\\)"    #Xe15e)
    ; ("\\(<->\\)"    #Xe154) ("\\(<=>\\)"    #Xe159)

    ; ;; Branches
    ; ("\\(-<\\)"  #Xe116) ("\\(-<<\\)" #Xe117)
    ; ("\\(>-\\)"  #Xe144) ("\\(>>-\\)" #Xe148)
    ; ("\\(=<<\\)" #Xe142) ("\\(>>=\\)" #Xe149)
    ; ("\\(>=>\\)" #Xe146) ("\\(<=<\\)" #Xe15a)

    ; ;; Squiggly
    ; ("\\(<~\\)" #Xe160) ("\\(<~~\\)" #Xe161)
    ; ("\\(~>\\)" #Xe167) ("\\(~~>\\)" #Xe169)
    ; ("\\(-~\\)" #Xe118) ("\\(~-\\)"  #Xe165)

    ; ;; MISC
    ; ("\\(www\\)"                   #Xe100)
    ; ("\\(<!--\\)"                  #Xe151)
    ; ("\\(~@\\)"                    #Xe164)
    ; ("[^<]\\(~~\\)"                #Xe168)
    ; ("\\(\\?=\\)"                  #Xe127)
    ; ("[^=]\\(:=\\)"                #Xe10c)
    ; ("\\(/>\\)"                    #Xe12e)
    ; ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
    ; ("[^:=]\\(:\\)[^:=]"           #Xe16c)
    ; ("\\(<=\\)"                    #Xe157)
    )
  "Fira font ligatures and their regexes")

(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
