
" Yellow:       Keyword
" Red:          Delimiter
" Orange:       Type
" Reddish:      PreProc
" Blue:         Function
" Green:        String
" Bold-lila:    Todo
" Pink:         Underlined
" Gray:         Comment


highlight link jiraMarkOn Keyword
highlight link jiraMarkOff Comment
highlight link jiraMarkCheck String
highlight link jiraMarkError Delimiter
highlight link jiraMarkWarn PreProc
highlight link jiraMarkYes String
highlight link jiraMarkNo PreProc
highlight link jiraMarkInfo Underlined

highlight link jiraPanelTitle Type
highlight link jiraPanelEnd Comment
highlight jiraBold gui=bold cterm=bold
highlight jiraItalic gui=italic cterm=underline

" TODO: Figure out how to make conceal chars the correct color
"
syntax match jiraMarkOn    /(on)/  " conceal cchar=⚙
syntax match jiraMarkOff   /(off)/ " conceal cchar=⚪
syntax match jiraMarkCheck /(\/)/  " conceal cchar=✔
syntax match jiraMarkError /(x)/
syntax match jiraMarkWarn  /(!)/   " conceal cchar=!
syntax match jiraMarkYes   /(y)/
syntax match jiraMarkNo    /(n)/
syntax match jiraMarkInfo  /(?)/
syntax cluster jiraMark contains=jiraMarkOn,jiraMarkOff,jiraMarkCheck,jiraMarkError,jiraMarkWarn,jiraMarkYes,jiraMarkNo

syntax match jiraItalic /_[^_]\+_/ excludenl contains=ALL
syntax match jiraBold /\*[^*]\+\*/ excludenl contains=ALL

syntax match    jiraNoFormat          "{noformat}\|{code}" contained
highlight link  jiraNoFormat          Comment
syntax region   jiraNoFormatRegion    start="{noformat}\|{code}" end="{noformat}\|{code}" contains=jiraNoFormat
highlight link  jiraNoFormatRegion    String

syntax region jiraPanel start="{panel:" end="{panel}" fold contains=ALL keepend
syntax region jiraPanelTitle matchgroup=Comment start="{panel:.\{-}\(title=\)" end="|.*}" contained 
syntax match jiraPanelEnd /{panel}/ contained

highlight link jiraTableHeader jiraBold
syntax region jiraTableHeader start="^\s*||" end="||\s*$" contains=ALL
syntax region jiraTableRow start="^\s*|" end="|\s*$" contains=ALL

set foldmethod=syntax
