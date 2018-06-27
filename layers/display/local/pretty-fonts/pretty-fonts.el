(require 'dash)

(provide 'pretty-fonts)

;;; API

;;;###autoload
(defun replicate (list num)
  "Creates a list with `num` replicas of `list`"
  (if (<= num 0) '() (append list (replicate list (- num 1)))))

;;;###autoload
(defun make-spaces (width point)
    (append (replicate '(?\s (Br . Bl)) (- width 1))
            '(?\s (Br . Br))
            (list (decode-char 'ucs point))))

;;;###autoload
(defun make-tabs (width point) (concat "\t" (list point)))

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
   nil (--map (-let (((width rgx uni-point) it))
               `(,rgx (0 (progn
                           (compose-region
                            (match-beginning 1) (match-end 1)
                            ,(make-tabs width uni-point))
                            ;,(make-spaces width uni-point))
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
  '(;; OPERATORS  ;; We use this format instead of the old one because it
    ;; the priorities work better
    (3 "\\(www\\)"                   #Xe100)
    (2 "[^/]\\(\\*\\*\\)[^/]"        #Xe101)
    (3 "\\(\\*\\*\\*\\)"             #Xe102)
    (3 "\\(\\*\\*/\\)"               #Xe103)
    (2 "\\(\\*>\\)"                  #Xe104)
    (2 "[^*]\\(\\*/\\)"              #Xe105)
    (3 "\\(\\\\\\\\\\)"              #Xe106)
    (4 "\\(\\\\\\\\\\\\\\)"          #Xe107)
    (2 "\\({-\\)"                    #Xe108)
    (2 "\\(\\[\\]\\)"                #Xe109)
    (2 "\\(::\\)"                    #Xe10a)
    (3 "\\(:::\\)"                   #Xe10b)
    (2 "[^=]\\(:=\\)"                #Xe10c)
    (2 "\\(!!\\)"                    #Xe10d)
    (2 "\\(!=\\)"                    #Xe10e)
    (3 "\\(!==\\)"                   #Xe10f)
    (2 "\\(-}\\)"                    #Xe110)
    (2 "\\(--\\)"                    #Xe111)
    (3 "\\(---\\)"                   #Xe112)
    (3 "\\(-->\\)"                   #Xe113)
    (2 "[^-]\\(->\\)"                #Xe114)
    (3 "\\(->>\\)"                   #Xe115)
    (2 "\\(-<\\)"                    #Xe116)
    (3 "\\(-<<\\)"                   #Xe117)
    (2 "\\(-~\\)"                    #Xe118)
    (2 "\\(#{\\)"                    #Xe119)
    (2 "\\(#\\[\\)"                  #Xe11a)
    (2 "\\(##\\)"                    #Xe11b)
    (3 "\\(###\\)"                   #Xe11c)
    (4 "\\(####\\)"                  #Xe11d)
    (2 "\\(#(\\)"                    #Xe11e)
    (2 "\\(#\\?\\)"                  #Xe11f)
    (2 "\\(#_\\)"                    #Xe120)
    (3 "\\(#_(\\)"                   #Xe121)
    (2 "\\(\\.-\\)"                  #Xe122)
    (2 "\\(\\.=\\)"                  #Xe123)
    (2 "\\(\\.\\.\\)"                #Xe124)
    (3 "\\(\\.\\.<\\)"               #Xe125)
    (3 "\\(\\.\\.\\.\\)"             #Xe126)
    (2 "\\(\\?=\\)"                  #Xe127)
    (2 "\\(\\?\\?\\)"                #Xe128)
    (2 "\\(;;\\)"                    #Xe129)
    (2 "\\(/\\*\\)"                  #Xe12a)
    (3 "\\(/\\*\\*\\)"               #Xe12b)
    (2 "\\(/=\\)"                    #Xe12c)
    (3 "\\(/==\\)"                   #Xe12d)
    (2 "\\(/>\\)"                    #Xe12e)
    (2 "\\(//\\)"                    #Xe12f)
    (3 "\\(///\\)"                   #Xe130)
    (2 "\\(&&\\)"                    #Xe131)
    (2 "\\(||\\)"                    #Xe132)
    (3 "\\(||=\\)"                   #Xe133)
    (2 "[^|]\\(|=\\)"                #Xe134)
    (2 "\\(|>\\)"                    #Xe135)
    (2 "\\(\\^=\\)"                  #Xe136)
    (2 "\\(\\$>\\)"                  #Xe137)
    (2 "\\(\\+\\+\\)"                #Xe138)
    (3 "\\(\\+\\+\\+\\)"             #Xe139)
    (2 "\\(\\+>\\)"                  #Xe13a)
    (4 "\\(=:=\\)"                   #Xe13b)
    (2 "[^!/]\\(==\\)[^>]"           #Xe13c)
    (3 "\\(===\\)"                   #Xe13d)
    (3 "\\(==>\\)"                   #Xe13e)
    (2 "[^=]\\(=>\\)"                #Xe13f)
    (3 "\\(=>>\\)"                   #Xe140)
    (2 "\\(<=\\)"                    #Xe141)
    (3 "\\(=<<\\)"                   #Xe142)
    (3 "\\(=/=\\)"                   #Xe143)
    (2 "\\(>-\\)"                    #Xe144)
    (2 "\\(>=\\)"                    #Xe145)
    (3 "\\(>=>\\)"                   #Xe146)
    (2 "[^-=]\\(>>\\)"               #Xe147)
    (3 "\\(>>-\\)"                   #Xe148)
    (3 "\\(>>=\\)"                   #Xe149)
    (3 "\\(>>>\\)"                   #Xe14a)
    (2 "\\(<\\*\\)"                  #Xe14b)
    (3 "\\(<\\*>\\)"                 #Xe14c)
    (2 "\\(<|\\)"                    #Xe14d)
    (3 "\\(<|>\\)"                   #Xe14e)
    (2 "\\(<\\$\\)"                  #Xe14f)
    (3 "\\(<\\$>\\)"                 #Xe150)
    (4 "\\(<!--\\)"                  #Xe151)
    (2 "\\(<-\\)"                    #Xe152)
    (3 "\\(<--\\)"                   #Xe153)
    (3 "\\(<->\\)"                   #Xe154)
    (2 "\\(<\\+\\)"                  #Xe155)
    (3 "\\(<\\+>\\)"                 #Xe156)
    (2 "\\(<=\\)"                    #Xe157)
    (3 "\\(<==\\)"                   #Xe158)
    (3 "\\(<=>\\)"                   #Xe159)
    (3 "\\(<=<\\)"                   #Xe15a)
    (2 "\\(<>\\)"                    #Xe15b)
    (2 "[^-=]\\(<<\\)"               #Xe15c)
    (3 "\\(<<-\\)"                   #Xe15d)
    (3 "\\(<<=\\)"                   #Xe15e)
    (3 "\\(<<<\\)"                   #Xe15f)
    (2 "\\(<~\\)"                    #Xe160)
    (3 "\\(<~~\\)"                   #Xe161)
    (2 "\\(</\\)"                    #Xe162)
    (3 "\\(</>\\)"                   #Xe163)
    (2 "\\(~@\\)"                    #Xe164)
    (2 "\\(~-\\)"                    #Xe165)
    (2 "\\(~=\\)"                    #Xe166)
    (2 "\\(~>\\)"                    #Xe167)
    (2 "[^<]\\(~~\\)"                #Xe168)
    (3 "\\(~~>\\)"                   #Xe169)
    (2 "\\(%%\\)"                    #Xe16a)
    (1 "[^:=]\\(:\\)[^:=]"           #Xe16c)
    (1 "[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
    (2 "[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f)

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
