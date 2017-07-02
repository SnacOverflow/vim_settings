
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" PLUGINS {{{1
"===============================================================================

set nocompatible                  " be iMproved, required by Vundle
filetype off                      " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ENVIRONMENT
Plugin 'gmarik/Vundle.vim' " required. Plugin management using Vundle
Plugin 'sjl/vitality.vim'  " Improvements for tmux (autofocus event + cursor)


Plugin 'scrooloose/nerdtree'     " Easy filesystem navigation
Plugin 'wincent/command-t'       " Quickly open cwd files by name
Plugin 'Lokaltog/vim-easymotion' " Direcly moving the cursor somewhere

" ENHANCEMENTS
Plugin 'tpope/vim-unimpaired'             " essential: group mappings to [ and ] for common functions
Plugin 'tpope/vim-surround'               " Essential: Surrounding text with (), {}, [] and more
Plugin 'tpope/vim-fugitive'               " Git intergration
Plugin 'tpope/vim-scriptease'             " vim plugin writing improvements
Plugin 'tpope/vim-speeddating'            " CTRL-X and CTRL-A enhancements for dates etc
Plugin 'godlygeek/tabular'                " Easy table creation
Plugin 'tpope/vim-dispatch'               " Async task runner
Plugin 'stefandtw/quickfix-reflector.vim' " Allows modifying all searchresults in quickfix window
Plugin 'tpope/vim-vinegar'                " Netrw upgrader (contains '-' shortcut)
Plugin 'tpope/vim-eunuch'                 " Filesystem commands in vim like (:Rename or :Remove)
Plugin 'artnez/vim-wipeout'               " Removes empty buffers
Plugin 'tpope/vim-repeat'                 " Improves vim's dot command-repeating
Plugin 'moll/vim-bbye'                    " Close current buffer without closing split
Plugin 'vim-voom/VOoM'                    " Shows an index for the current file
Plugin 'sk1418/HowMuch'                   " Calculate slections
Plugin 'airblade/vim-gitgutter'           " Shows the file's git-status in a gutter
" Plugin 'henrik/vim-open-url'            " Improvements to open an url on the current line
" Plugin 'etnadji/vim-epub'                 " View epub -> disabled because slow


" CODING
Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-abolish'
Plugin 'kana/vim-vspec'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'fatih/vim-go'
Plugin 'Shougo/deoplete.nvim'
Plugin 'neomake/neomake'                  " Syntax linter (NeoVim)
Plugin 'meonlol/vim-godebug'              " Debugger for go
Plugin 'dearrrfish/vim-applescript'


" STYLING & SYNTAX
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tfnico/vim-gradle'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/MultipleSearch'



" MY STUFF
Plugin 'http://meonlol@192.168.178.23/meonlol/vim-logsearch.git'
" Plugin 'meonlol/vim-android'
" Plugin 'meonlol/vim-grand'
Plugin 'meonlol/vim-java-hi-semantics'
Plugin 'meonlol/vim-gosem'
" Plugin 'meonlol/javacomplete'
" Plugin 'meonlol/vim-android'
" Plugin 'meonlol/vim-grand'


" TRIED
" Maybe try again later
" Plugin 'dhruvasagar/vim-table-mode'   " Interesting for makeing tables (exel)
" Plugin 'etnadji/vim-epub'             " Used once
" Plugin 'rhysd/vim-grammarous'         " For grammar checking. Uses some webtool


" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle


"}}}
" GENERAL {{{1
"===============================================================================


" ENVIRONMENT
set nocompatible     " use vim defaults
set nobackup         " do not keep a backup file
set noswapfile       " don't want no swap-files either. Might disable if ever it causes problems for me. I'm a compulsive saver anyway.
set visualbell t_vb= " turn off error beep/flash
set visualbell       " turn off visual bell
set hidden           " allow swapping to other buffer when unwritten

set backspace=indent,eol,start " make that backspace key work the way it should (only in terminal)
set mouse=a                    " Enable scrolling just in case I have my hands on the mouse accidentally
set relativenumber             " Easier moving stuff around.

set hlsearch        " highlight searches. Practical with * search (see mapleaders)

set nostartofline   " CTRL-F etc will not go to the start of the line

botright cwindow " Make cwindow always full width

" UI
set scrolloff=3     " keep 3 lines when scrolling
set number          " show line numbers
set ruler           " show the current row and column
set showcmd         " display incomplete commands
set lbr             " wrapping doesn't break words inbetween
set nowrap          " default: no wrapping
set wildmenu        " tab completion for help


" TEXT EDITING
set nojoinspaces " Don't add a second space after a dot on reformatting
set ai           " set auto-indenting on for programming
set tabstop=4    " Uses 4 colums (spaces) for a tab
set shiftwidth=4 "
set expandtab    " use spaces in stead of tabs
" set noexpandtab  " use tabs in stead of spaces
" TRICK: use 'set et|retab' to convert all tabs to spaces or 'set noet|retab!' for the reverse


" SEARCHING
set incsearch       " do incremental searching
set ignorecase      " ignore case when searching
set smartcase       " no ignorecase if Uppercase char present

" FILES
syntax on          " turn syntax highlighting on by default
filetype on        " detect type of file
filetype indent on " load indent file for specific file type
filetype plugin on " ?
set autoread
set autowrite
set tags+=.tags    " I want to use hidden tags files





let mapleader = "\<SPACE>"

" switch to last buffer.
noremap ,b :b#<CR>

" delte current buffer without closing window
noremap _b :Bdelete<CR>


" Using the arrow-keys in the command-line navigates the command-history
" filtered by the input text, CTRL-P does the same without filtering. Since I
" don't want no arrow key-usage, make CTRL-P use the filtering too.
cnoremap <C-p> <Up>

" Removes quickfix buffer from showing up using :bnext and the like.
autocmd FileType qf set nobuflisted

"}}}

" STYLING {{{1
"----------------------------------------

set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
set background=dark

let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" let g:solarized_termcolors= 256 "Guess I shouldn't use this one
let g:solarized_termtrans = 1
colorscheme solarized

" set guifont=Menlo\ Regular:h12
set t_Co=256

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme='solarized'
set laststatus=2    " always show, not just with when the view is split


" Set custom (shorter) symbols to display
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


" Displays the current mode, but shorter than the default
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }


"}}}
" NAVIGATION {{{1
"----------------------------------------
map <leader>s <Plug>(easymotion-s)
map <leader>f <Plug>(easymotion-f)
map <leader>F <Plug>(easymotion-F)

noremap <leader>t :CommandT<CR>
set wildignore=**/build/*,**/.git/*,*.class

let NERDTreeWinSize = 50
let NERDTreeBookmarksSort = 0
let NERDTreeShowLineNumbers=1

noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>N :NERDTreeFind<CR>

command! Lvimrc e ~/.vim/vimrc

let NERDTreeHijackNetrw=1

" easyer window commands
noremap <leader>w <C-W>
noremap <leader>h <C-W>h
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>l <C-W>l

noremap <C-h> zhzhzh
noremap <C-j> <C-e><C-e>
noremap <C-k> <C-y><C-y>
noremap <C-l> zlzlzl

" navigation those anoying wrapped lines like a human
nmap j gj
nmap k gk


"}}}
" CODING {{{1
"----------------------------------------

let g:UltiSnipsExpandTrigger = "<c-l>"

autocmd! BufWritePost * Neomake

autocmd FileType java set omnifunc=javacomplete#Complete
autocmd BufRead,BufNewFile *.java       setlocal syntax=java2
autocmd BufWritePost *.java     silent! setlocal syntax=java2

autocmd FileType groovy set commentstring=//%s
autocmd FileType markdown set commentstring=<!--%s-->

autocmd BufRead,BufNewFile *.go       setlocal syntax=vim-gosem
autocmd BufWritePost *.go     silent! setlocal syntax=vim-gosem
autocmd FileType go map <Leader>ul :GoTest!<CR>
autocmd BufWritePre *.go silent! GoImports
autocmd BufWritePost *.go silent! !gotags -R -f=".tags" .
let g:syntastic_go_checkers = ['go']

" see: https://github.com/vim-ruby/vim-ruby/blob/master/doc/ft-ruby-omni.txt
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1


" nnoremap <leader>y :call YcmToggle()<CR>
command! ToggleCompletion call ToggleCompletion()
function! ToggleCompletion()
    if g:ycm_auto_trigger == 1
        let g:ycm_auto_trigger=0
        call deoplete#enable()
        echo "ycm off, deoplete on"
    else
        let g:ycm_auto_trigger=1
        call deoplete#disable()
        echo "ycm on, deoplete off"
    endif
endfunction
"}}}

" REFACTORING {{{1
"----------------------------------------

" Easy search-and-replace
"----------------------------------------
" Takes the current word under the cursor and opens the command-line window
" with the '%s/old/new/gc' command filled in. Insert mode is available in this
" window for easy editing (see :help c_CTRL-F).
" If used in visual mode, you can search for multiple words or parts of words.
vnoremap <expr> ,r ReplaceCurrentSelection()
nnoremap <expr> ,r ReplaceCurrentWord()

" runs in all windows
vnoremap <expr> ,R ReplaceCurrentSelection("windo")
nnoremap <expr> ,R ReplaceCurrentWord("windo")


fu! ReplaceCurrentWord(...)
    let l:wordToReplace = expand("<cword>")
    let l:openCmdWin = "q:i"     "open cmdline-window in insert mode

    let l:search = "\\<" . l:wordToReplace . "\\>"
    let l:substitution = "%s/" . l:search . "/" . l:wordToReplace . "/gc"

    " the \u001B is unicode for escape. :map-<expr> is freaky
    let l:moveToReplacement = " \u001B2T/"

    " add stuff like 'windo' or 'argdo' to perform it on multiple buffers
    if a:0==1
        return l:openCmdWin . a:1 . " " . l:substitution . l:moveToReplacement
    else
        return l:openCmdWin . l:substitution . l:moveToReplacement
    endif
endfu

fu! ReplaceCurrentSelection(...)
    let l:wordToReplace = s:get_visual_selection()

    "open cmdline-window, delete \<\> and enter in insert mode
    let l:openCmdWin = "q:S"
    let l:substitution = "%s/" . l:wordToReplace . "/" . l:wordToReplace . "/gc"

    " the \u001B is unicode for escape. :map-<expr> is freaky
    let l:moveToReplacement = " \u001B2T/"

    " add stuff like 'windo' or 'argdo' to perform it on multiple buffers
    if a:0==1
        return l:openCmdWin . a:1 . l:substitution . l:moveToReplacement
    else
        return l:openCmdWin . l:substitution . l:moveToReplacement
    endif
endfu

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction



" multi-file search and replace
"----------------------------------------
" The following commands simply search the word under the cursor, ether using
" the platinum searcher, with vimgrep as a fallback. The results are then
" simply displayed in the quickfix window. When we than combine this with the
" stefandtw/quickfix-reflector plugin, which allows editing in the quickfix
" window and saving the results into the correct files, it becomes a powerfull
" refactoring tool.
" I use this in combenation with the above shortcut, to search all occurrences
" in the cwd with these commands, and then replace them from the quickfix
" window with the <F6> one.
" TODO: Expand with selection like above
noremap ,/ :call SeachWordInCwd()<CR>

fu! SeachWordInCwd()
    let oldgrepprg = &grepprg
    let orig_grepformat = &grepformat
    let g:wordUnderCursor = expand("<cword>")

    if exepath("pt") != ""
        " Use the super-fast platinum searcher as a grep replacement
        " go get -u github.com/monochromegane/the_platinum_searcher/...
        let &grepprg = "pt --nocolor --nogroup -w "
        let searchCmd = "\"" . g:wordUnderCursor . "\" ."
        let searchCmd = "silent grep! " . searchCmd
    else
        let searchCmd = "vimgrep /\\<" . g:wordUnderCursor . "\\>/j **/*." .  expand('%:e')
    endif

    echomsg searchCmd
    execute searchCmd
    cw

    let &grepprg = oldgrepprg
    let &grepformat = orig_grepformat
endfu

" WRITING {{{1
"===============================================================================

set formatprg=par\ w78

" Toggle spelling or enable the spell checker if the language is specified
command! -nargs=? Sp call SpelCheck('<args>')
fu! SpelCheck(...)
    if (a:1 ==# 'nl')
        setlocal spell spelllang=nl
    elseif (a:1 ==# 'de')
        setlocal spell spelllang=de_de
    elseif (a:1 ==# 'en')
        setlocal spell spelllang=en_us
    else
        setlocal spell!
    endif
endfu

" mappings for quick markdown style headers
nmap <leader>m1 o<ESC>80i=<ESC>0k
nmap <leader>m2 o<ESC>80i-<ESC>0k
nmap <leader>m3 I### <ESC>
nmap <leader>m4 I#### <ESC>

" Quick Reformat paragraph
nmap <leader>a gqap

noremap <leader>\| :Tabularize/\|<CR>

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"}}}
" EXPERIMENTAL {{{1
"===============================================================================



noremap ,a :call LogSearch() <bar> cw <CR>
noremap ,h :set ft=slog <bar> call LogHighlight()<CR>
noremap ,e :tabe ~/.vim/plugin/vim-logsearch/searches.rb<CR>


function! GetBufferList()
    redir =>buflist
    silent! ls!
    redir END
    return buflist
endfunction

function! ToggleList(bufname, pfx)
    let buflist = GetBufferList()
    for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
        if bufwinnr(bufnum) != -1
            exec(a:pfx.'close')
            return
        endif
    endfor
    if a:pfx == 'l' && len(getloclist(0)) == 0
        echohl ErrorMsg
        echo "Location List is Empty."
        return
    endif
    let winnr = winnr()
    exec(a:pfx.'open')
    " if winnr() != winnr
    "     wincmd p
    " endif
endfunction

nnoremap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>
" nnoremap <silent> <leader>el :call ToggleList("Location List", 'l')<CR>


" copied from vim-unimpaired
function! s:MapNextFamily(map,cmd)
  let map = '<Plug>unimpairedCustom'.toupper(a:map)
  let cmd = '".(v:count ? v:count : "")."'.a:cmd
  let end = '"<CR>'.(a:cmd == 'l' || a:cmd == 'c' ? 'zv' : '')
  execute 'nnoremap <silent> '.map.'Previous :<C-U>exe "'.cmd.'previous'.end
  execute 'nnoremap <silent> '.map.'Next     :<C-U>exe "'.cmd.'next'.end
  execute 'nnoremap <silent> '.map.'First    :<C-U>exe "'.cmd.'first'.end
  execute 'nnoremap <silent> '.map.'Last     :<C-U>exe "'.cmd.'last'.end
  execute 'nmap <silent> ['.        a:map .' '.map.'Previous'
  execute 'nmap <silent> ]'.        a:map .' '.map.'Next'
  execute 'nmap <silent> ['.toupper(a:map).' '.map.'First'
  execute 'nmap <silent> ]'.toupper(a:map).' '.map.'Last'
  if exists(':'.a:cmd.'nfile')
    execute 'nnoremap <silent> '.map.'PFile :<C-U>exe "'.cmd.'pfile'.end
    execute 'nnoremap <silent> '.map.'NFile :<C-U>exe "'.cmd.'nfile'.end
    execute 'nmap <silent> [<C-'.a:map.'> '.map.'PFile'
    execute 'nmap <silent> ]<C-'.a:map.'> '.map.'NFile'
  endif
endfunction

call s:MapNextFamily('w','tab')






nnoremap ,t :call OpenOther()<CR>

fu! OpenOther()
    if &filetype == "java"
        call OpenOtherJava()
    elseif &filetype == "ruby"
        call OpenOtherRuby()
    elseif &filetype == "go"
        :GoAlternate
    endif
endfu

fu! OpenOtherJava()
    let testSuffix = "Test.java"
    let nonTestSuffix = ".java"
    let mainDir = "/main/"
    let testDir = "/test/"

    " Files & paths
    let relPath = GetRelativeFilePath()
    let srcFile = expand('%:t')

    " Change path
    let targetPath = ""
    if (stridx(relPath, mainDir) > -1)
        let targetPath = substitute(relPath, mainDir, testDir, "")
    elseif (stridx( relPath, testDir) > -1)
        let targetPath = substitute(relPath, testDir, mainDir, "")
    endif

    " Change fileName
    let targetFile = ""
    if (stridx(srcFile, testSuffix) > -1)
        let targetFile = substitute(srcFile, testSuffix, nonTestSuffix, "")
    else
        let targetFile = substitute(srcFile, nonTestSuffix, testSuffix, "")
    endif

    call OpenFileAtPath(targetFile, targetPath)
endfu


fu! OpenOtherRuby()
    let testPrefix = "tc_"

    " Files & paths
    let srcFile = expand('%:t')

    " Change fileName
    let targetFile = ""
    if (stridx(srcFile, testPrefix) > -1)
        let targetFile = substitute(srcFile, testPrefix, "", "")
    else
        let targetFile = testPrefix . srcFile
    endif

    call OpenFileAtPath(targetFile, GetRelativeFilePath())
endfu


fu! OpenFileAtPath(fileName, path)
    let completePath = a:path . '/' . a:fileName
    if filereadable(completePath)
        execute "edit " . completePath
    " else
    "     echomsg "File not found: " . completePath
    endif
endfu


fu! GetRelativeFilePath()
    let fullPath = expand('%:p:h')
    return substitute(fullPath, getcwd() . "/" , "", "")
endfu

command! Asformat call AppleScriptFormat()
function! AppleScriptFormat()
    execute "%s/},/},\r\t/g | %s/alias/\r\t\t\talias/g | noh"
endfunction


"}}}
"

autocmd FileType groovy map <Leader>ul :Disp ./gradlew test --console plain<CR>

augroup slog
    autocmd!

    autocmd BufRead,BufNewFile *.slog		set filetype=slog
augroup END


" :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk -layout <q-args> -


"----------------------------------------------------------------
" vim:fdm=marker:
