
" Yellow:       Keyword
" Red:          Delimiter
" Orange:       Type
" Reddish:      PreProc
" Blue:         Function
" Green:        String
" Bold-lila:    Todo
" Pink:         Underlined
" Gray:         Comment


syn match       panelDef            "{panel.*}"
hi def link     panelDef            Comment

syn match       markQuestion            "(?).*"
hi def link     markQuestion            Keyword

syn match       markNotDone            "(x).*"
hi def link     markNotDone            Delimiter

syn match       markDone            "(/).*"
hi def link     markDone            String

syn match       link            "\[.*\]"
hi def link     link            Underlined

syn match       jiraTask            "TASK\d\d-\d\+"
hi def link     jiraTask            Underlined
