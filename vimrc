
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
" Plugin 'L9'                " Common library. Is it used?


Plugin 'scrooloose/nerdtree'     " Easy filesystem navigation
Plugin 'wincent/command-t'       " Quickly open cwd files by name
Plugin 'Lokaltog/vim-easymotion' " Direcly moving the cursor somewhere
" Plugin 'rhysd/vim-grammarous'    " Plugin for grammar checking

" ENHANCEMENTS
Plugin 'tpope/vim-unimpaired'             " essential: group mappings to [ and ] for common functions
Plugin 'tpope/vim-surround'               " Essential: Surrounding text with (), {}, [] and more
Plugin 'tpope/vim-fugitive'               " Git intergration
Plugin 'tpope/vim-scriptease'             " vim plugin writing improvements
Plugin 'tpope/vim-speeddating'            " CTRL-X and CTRL-A enhancements for dates etc
Plugin 'godlygeek/tabular'                " Easy table creation
Plugin 'tpope/vim-dispatch'               " Async task runner
Plugin 'stefandtw/quickfix-reflector.vim' " Allows modifying all searchresults in quickfix window
"Plugin 'tpope/vim-vinegar'                " Netrw upgrader > REMOVE?
Plugin 'tpope/vim-eunuch'                 " Filesystem commands in vim like (:Rename or :Remove)
Plugin 'artnez/vim-wipeout'               " Removes empty buffers
Plugin 'tpope/vim-repeat'                 " Improves vim's dot command-repeating
" Plugin 'henrik/vim-open-url'              " Improvements to open an url on the current line
Plugin 'moll/vim-bbye'                    " Close current buffer without closing split

" CODING
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-abolish'
" Plugin 'meonlol/vim-rubytest'
Plugin 'kana/vim-vspec'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'fatih/vim-go'

" STYLING & SYNTAX
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tfnico/vim-gradle'
Plugin 'nelstrom/vim-markdown-folding'    " Markdown folding

" MY STUFF
" Plugin 'meonlol/vim-android'
Plugin 'meonlol/pyunit.vim'
" Plugin 'meonlol/vim-grand'
" Plugin 'meonlol/vim-java-hi-semantics'
Plugin 'meonlol/vim-gosem'
" Plugin 'meonlol/javacomplete'


" TRIED
" Maybe try again later
" Plugin 'dhruvasagar/vim-table-mode' " Interesting for makeing tables (exel
" Plugin 'Shougo/javacomplete'
" Plugin 'yegappan/greplace'          " Never used
" Plugin 'reinh/vim-makegreen'        " Do I even use this?
" Plugin 'vim-scripts/JavaImp.vim--Lee' " Not used.


" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle


"}}}
" GENERAL_SETTINGS {{{1
"===============================================================================


" ENVIRONMENT
set nocompatible     " use vim defaults
set nobackup         " do not keep a backup file
set noswapfile       " don't want no swapfiles eather. Might disable if ever it causes problems for me. I'm a compulsive saver anyway.
set visualbell t_vb= " turn off error beep/flash
set visualbell       " turn off visual bell
set hidden           " allow swapping to other buffer when unwritten

set backspace=indent,eol,start " make that backspace key work the way it should (only in terminal)
set mouse=a                    " Scroling using the mouse if I have my hands there accidentally
set relativenumber             " Easier moving stuff around.

set hlsearch        " highlight searches. Pratical with * search (see mapleaders)


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
" set noexpandtab  " use tabs in stead of spaces
set expandtab    " use spaces in stead of tabs
" TRICK: use 'set et|retab' to convert all tabs to spaces or 'set noet|retab!' for the reverse

set formatprg=par\ w78

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

set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" au FocusGained,BufEnter * :silent! e
" au FocusLost,WinLeave * :silent! w



" THEME
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" let g:solarized_termcolors= 256 "Guess I shouldn't use this one
let g:solarized_termtrans = 1
colorscheme solarized

" set guifont=Menlo\ Regular:h12
set t_Co=256


let NERDTreeHijackNetrw=1


"}}}
" GENERAL_MAPPINGS {{{1
"===============================================================================

let mapleader = "\<SPACE>"

noremap <leader>n :NERDTreeToggle<CR>

noremap <leader>\| :Tabularize/\|<CR>

" switch to last buffer.
noremap ,b :b#<CR>

" delte current buffer without closing window
noremap _b :Bdelete<CR>

" for those anoying wrapping lines
nmap j gj
nmap k gk


" easyer window commands
noremap <leader>w <C-W>
noremap <leader>h <C-W>h
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>l <C-W>l

" Use CTRL-P for command-history, using entered text to match.
cnoremap <C-p> <Up>

" Quick Reformat paragraph
nmap <leader>a gqap

" mappings for quick markdown style headers
nmap <leader>m1 o<ESC>80i=<ESC>0k
nmap <leader>m2 o<ESC>80i-<ESC>0k
nmap <leader>m3 I### <ESC>
nmap <leader>m4 I#### <ESC>

" Removes quickfix buffer from showing up using :bnext and the like.
autocmd FileType qf set nobuflisted

" REFACTORING TOOLS & TRICKS

" Quick search and replace
"
" Takes the current word under the cursor and opens the command-line window
" (see :help c_CTRL-F) with the '%s/old/new/gc' command filled in. Insert mode
" is available in this window for easy editing. Press <CR> from normal mode to
" execute the search and replace.
" Protip: add 'windo', 'buffdo' etc to run the find and replace in all windows, buffers etc
noremap <F6> :let g:replacingString = expand("<cword>")<CR> q:i%s/\<<c-r>=g:replacingString<cr>\>/<c-r>=g:replacingString<cr>/gc<ESC>2T/

" The following commands simply search the word under the cursor, ether using
" the platinum searcher, with vimgrep as a fallback. The results are then
" simply displayed in the quickfix window. When we than combine this with the
" stefandtw/quickfix-reflector plugin, which allows editing in the quickfix
" window and saving the results into the correct files, it becomes a powerfull
" refactoring tool.
" I use this in combenation with the above shortcut, to search all occurrences
" in the cwd with these commands, and then replace them from the quickfix
" window with the <F6> one.
noremap <F7> :call SeachWordInCwd()<CR>

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

"}}}
" COMMANDS {{{.
"===============================================================================

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

" Rebuild tags for central notes
command! Lvimrc e ~/.vim/vimrc

command! Ltwenty read !~/Dropbox/leon/developing/python/major_numbers/twenty.py
command! Ltwenty2 read ~/.twenty_last
command! Last :ruby puts `last -1 reboot`

command! Calc exec '%s:!\(.*\)=.*:\="!". submatch(1) . "= ". eval(submatch(1)):g'

"}}}
" PLUGIN SPECIFIC {{{1
"===============================================================================

" AIRLINE {{{2
"----------------------------------------
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
" COMMAND_T {{{2
"----------------------------------------
noremap <leader>t :CommandT<CR>
set wildignore=**/build/*,**/.git/*,*.class

"}}}
" EASYMOTION {{{2
"----------------------------------------
map <leader>s <Plug>(easymotion-s)
map <leader>f <Plug>(easymotion-f)
map <leader>F <Plug>(easymotion-F)



"}}}
" JAVACOMPLETE2 {{{2
"----------------------------------------

	" :setlocal omnifunc=javacomplete#Complete
    autocmd FileType java set omnifunc=javacomplete#Complete

"}}}
" NERDTREE {{{2
"----------------------------------------
let NERDTreeWinSize = 50
let NERDTreeBookmarksSort = 0
let NERDTreeShowLineNumbers=1

"}}}
" ULTISNIPS {{{2
"----------------------------------------
let g:UltiSnipsExpandTrigger = "<c-l>"


" VIM_COMMENTARY {{{2
"----------------------------------------
autocmd FileType groovy set commentstring=//%s
autocmd FileType markdown set commentstring=<!--%s-->

"}}}
" VIM_GO {{{2
"----------------------------------------
autocmd FileType go map <Leader>ul :GoTest!<CR>
autocmd BufWritePre *.go silent! GoImports
autocmd BufWritePost *.go silent! !gotags -R -f=".tags" .
let g:syntastic_go_checkers = ['go']

" Refactor shortcut
" Takes the current word under the cursor and opens the command-line window
" (see :help c_CTRL-F) with the 'gofmt -r' command filled in. Insert mode
" is available in this window. Press <CR> from normal mode to execute the
" refactoring"
" autocmd FileType go noremap <C-F6> :let g:replacingString = expand("<cword>")<CR> q:i!gofmt -r '<c-r>=g:replacingString<cr> -> <c-r>=g:replacingString<cr>' -w *.go **/*.go<ESC>4B'

"}}}
" VIM_GOSEM {{{2
"----------------------------------------
autocmd BufRead,BufNewFile *.go       setlocal syntax=vim-gosem
autocmd BufWritePost *.go     silent! setlocal syntax=vim-gosem

"}}}
" VIM_GRAND {{{2
"----------------------------------------

autocmd FileType java noremap <Leader>i :GrandInstall<CR>

augroup grand_autocmd
    autocmd!

    " " works with :make not with :Make
    " autocmd BufReadPost quickfix :call PostFunction()

    " " doesn't work with :Dispatch or :Make
    " " autocmd BufReadPost cgetfile :call PostFunction()

    " autocmd FileType java compiler gradle

    autocmd FileType java nnoremap <leader>u :GrandTest<CR>
    autocmd FileType java nnoremap <leader>uc :GrandTest %<CR>


    " autocmd FileType java nnoremap <leader>u :call GrandTest("")<CR>
    " autocmd FileType java nnoremap <leader>uc :call GrandTest("-DtestDebug.single=%:t:r")<CR>

    " autocmd FileType java nnoremap <leader>u :w<bar>make test<CR>
    " autocmd FileType java nnoremap <leader>uc :w<bar>make test -DtestDebug.single=%:t:r<CR>



    " Use vim-dispatch to run gradleTest
    " autocmd FileType java nnoremap <leader>u :w<bar>Dispatch ./gradlew testDebug<CR>
    " This runs my android gradle test for this class only
    " autocmd FileType java nnoremap <leader>u :w<bar>Dispatch ./gradlew testDebug -DtestDebug.single=%:t:r<CR>

    " Run GrandCtags command every time you save a java file
    autocmd BufWritePost *.java silent! GrandTags
augroup END

fu! GrandTest(args)
    w
    let base_command = "Make testDebug"
    let sed_command = " \| ruby -n ~/.vim/bundle/vim-grand/filter/quick_fix_filter.rb"

    if strlen(a:args) > 0
        execute base_command . " " . a:args . sed_command
    else 
        execute base_command . sed_command
    endif
endfu

fu! PostFunction()
    echoms "PostFunction called"
    if exists("g:grand_was_run") && g:grand_was_run == 1
        let g:grand_was_run = 0
        ruby Grand.loadTestResults()
    endif
endfu


"}}}
" VIM_JAVA_HI_SEMANTICS {{{2
"----------------------------------------
autocmd BufRead,BufNewFile *.java       setlocal syntax=java2
autocmd BufWritePost *.java     silent! setlocal syntax=java2
" autocmd BufWritePost *.java        silent! setlocal syntax=java2 | exe "normal! g`\""
" autocmd BufWritePost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`^" | endif
" autocmd BufWritePost *  silent!    exe "normal! g`^"


"}}}
" VIM_OPEN_URL {{{2
"----------------------------------------
noremap gx :OpenURL<CR>

"}}}
" VIM_RUBY {{{2
"----------------------------------------

" see: https://github.com/vim-ruby/vim-ruby/blob/master/doc/ft-ruby-omni.txt
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1


"}}}
" YOUCOMPLETEME {{{2
"----------------------------------------
nnoremap <leader>y :call YcmToggle()<CR>

function! YcmToggle()
    if g:ycm_auto_trigger == 1
        let g:ycm_auto_trigger=0
        echo "ycm off"
    else
        let g:ycm_auto_trigger=1
        echo "ycm on"
    endif
endfunction
"}}}
" VIM_RUBYTEST {{{2
"----------------------------------------

" Doesn't work with noremap for some reason
autocmd FileType ruby map <Leader>ut <Plug>RubyTestRun
autocmd FileType ruby map <Leader>uc <Plug>RubyFileRun
autocmd FileType ruby map <Leader>ul <Plug>RubyTestRunLast

"}}}
" EXPERIMENTAL {{{1
"===============================================================================


" http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
" command! -bang -nargs=? QFix call QFixToggle(<bang>0)
" function! QFixToggle(forced)
"   if exists("g:qfix_win") && a:forced == 0
"     cclose
"     unlet g:qfix_win
"   else
"     copen 10
"     let g:qfix_win = bufnr("$")
"   endif
" endfunction

" nnoremap <silent> <leader>e :QFix<CR>


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

" nnoremap <silent> <leader>e :QFix<CR>
nnoremap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>


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


" macros
" Insert member: o,'+ *'
" Insert arg: o,'*'bbdwwi: "

"}}}
"

autocmd FileType groovy map <Leader>ul :Disp ./gradlew test --console plain<CR>

augroup vimp
    autocmd!

    autocmd BufRead,BufNewFile *.vimp		set filetype=help
    autocmd BufRead,BufNewFile *.vimp		set isk=!-~,^*,^\|,^\"
augroup END

augroup slog
    autocmd!

    autocmd BufRead,BufNewFile *.slog		set filetype=slog
augroup END

" :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk -layout <q-args> -


"----------------------------------------------------------------
" vim:fdm=marker:
