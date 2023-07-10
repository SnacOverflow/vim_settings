
" Yellow:       Keyword
" Red:          Delimiter
" Orange:       Type
" Reddish:      PreProc
" Blue:         Function
" Green:        String
" Bold-lila:    Todo
" Pink:         Underlined
" Gray:         Comment


" syn match       titleDef            /\(title=\)\@<=[^|]\+/
" hi def link     titleDef            Error

" syn region      panelReg            start="^{panel" end="}" contains=titleDef
" hi def link     panelReg            Comment

" syn match       markQuestion        "(?).*"
" hi def link     markQuestion        Function

" syn match       markNotDone         "(x).*"
" hi def link     markNotDone         Delimiter

" syn match       markDone            "(/).*"
" hi def link     markDone            String

" syn match       linkTitle           /\(\[\)\@<=[^|\]]\+/ contained
" hi def link     linkTitle           Type
" syn match       linkBody            /\(|\)\@<=[^\]]\+/ contained
" hi def link     linkBody            Underlined
" syn region      linkReg             start="\[" end="\]" contains=linkTitle,linkBody

" syn match       jiraTask            "TASK\d\d-\d\+"
" hi def link     jiraTask            Underlined

highlight jiraMarkOn ctermfg=yellow guifg=yellow
highlight jiraMarkOff ctermfg=darkgrey guifg=darkgrey
highlight jiraMarkCheck ctermfg=green guifg=green
highlight jiraMarkError ctermfg=red guifg=red
highlight jiraMarkWarn ctermfg=202 guifg=#ff5f00
highlight jiraMarkYes ctermfg=green guifg=green
highlight jiraMarkNo ctermfg=red guifg=red
highlight jiraMarkInfo ctermfg=blue guifg=blue

highlight link jiraPanelTitle Title
highlight hide guifg=darkgrey ctermfg=darkgrey
highlight link jiraPanelEnd hide
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

syntax region jiraNoFormat matchgroup=hide start="{noformat}" end="{noformat}" keepend

syntax region jiraPanel start="{panel:" end="{panel}" fold contains=ALL keepend
syntax region jiraPanelTitle matchgroup=hide start="{panel:.\{-}\(title=\)" end="|.*}" contained 
syntax match jiraPanelEnd /{panel}/ contained

highlight link jiraTableHeader jiraBold
syntax region jiraTableHeader start="^\s*||" end="||\s*$" contains=ALL
syntax region jiraTableRow start="^\s*|" end="|\s*$" contains=ALL

set foldmethod=syntax
