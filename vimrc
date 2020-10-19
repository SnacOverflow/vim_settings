
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" PLUGINS {{{1
"===============================================================================

set nocompatible                  " be iMproved, required by Vundle

filetype off                      " required by Vundle

call plug#begin('~/.vim/bundle')

" ENVIRONMENT
Plug 'gmarik/Vundle.vim' " required. Plugin management using Vundle
Plug 'sjl/vitality.vim'  " Improvements for tmux (autofocus event + cursor)


Plug 'scrooloose/nerdtree'      " Easy filesystem navigation
" Plug 'wincent/command-t'      " Quickly open cwd files by name
Plug 'Lokaltog/vim-easymotion'  " Direcly moving the cursor somewhere
" fzf is a system fuzzy finder. His also installs it.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" ENHANCEMENTS
Plug 'tpope/vim-unimpaired'             " essential: group mappings to [ and ] for common functions
Plug 'tpope/vim-surround'               " Essential: Surrounding text with (), {}, [] and more
Plug 'tpope/vim-fugitive'               " Git intergration
Plug 'tpope/vim-scriptease'             " vim plugin writing improvements
Plug 'tpope/vim-speeddating'            " CTRL-X and CTRL-A enhancements for dates etc
Plug 'godlygeek/tabular'                " Easy table creation
Plug 'tpope/vim-dispatch'               " Async task runner
Plug 'stefandtw/quickfix-reflector.vim' " Allows modifying all searchresults in quickfix window
Plug 'tpope/vim-vinegar'                " Netrw upgrader (contains '-' shortcut)
Plug 'tpope/vim-eunuch'                 " Filesystem commands in vim like (:Rename or :Remove)
Plug 'artnez/vim-wipeout'               " Removes empty buffers
Plug 'tpope/vim-repeat'                 " Improves vim's dot command-repeating
Plug 'vim-voom/VOoM'                    " Shows an index for the current file
Plug 'sk1418/HowMuch'                   " Calculate slections
Plug 'airblade/vim-gitgutter'           " Shows the file's git-status in a gutter
Plug 'udalov/kotlin-vim'
" Plugin 'henrik/vim-open-url'            " Improvements to open an url on the current line
" Plugin 'etnadji/vim-epub'                 " View epub -> disabled because slow
" Plug 'tpope/vim-dadbod'                 " Db access
Plug 'junegunn/vader.vim'               " Testing library

" CODING
Plug 'tpope/vim-commentary'
" Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'kana/vim-vspec'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'neomake/neomake'                  " Syntax linter (NeoVim)
Plug 'dearrrfish/vim-applescript'
Plug 'meonlol/vim-subvenient'
Plug 'mitsuse/autocomplete-swift'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/taglist.vim'
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
" neovim only plugins
if has("nvim")
  Plug 'fatih/vim-go'
  Plug 'meonlol/vim-godebug'              " Debugger for go
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif




" STYLING & SYNTAX
Plug 'altercation/vim-colors-solarized'
Plug 'endel/vim-github-colorscheme'
Plug 'tfnico/vim-gradle'
Plug 'vim-scripts/MultipleSearch'
Plug 'vim-scripts/groovyindent-unix'
Plug 'udalov/javap-vim'
if has("nvim")
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif




" MY STUFF
" Plug 'http://meonlol@192.168.178.23/meonlol/vim-logsearch.git'
" Plugin 'meonlol/vim-android'
" Plugin 'meonlol/vim-grand'
Plug 'meonlol/vim-java-hi-semantics'
Plug 'meonlol/vim-gosem'
" Plugin 'meonlol/javacomplete'
" Plugin 'meonlol/vim-android'
" Plugin 'meonlol/vim-grand'


" TRIED
" Maybe try again later
" Plugin 'dhruvasagar/vim-table-mode'   " Interesting for makeing tables (exel)
" Plugin 'etnadji/vim-epub'             " Used once
" Plugin 'rhysd/vim-grammarous'         " For grammar checking. Uses some webtool


" All of your Plugins must be added before the following line
" call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle
call plug#end()



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
set scrolloff=3           " keep 3 lines when scrolling
set number                " show line numbers
set ruler                 " show the current row and column
set showcmd               " display incomplete commands
set lbr                   " wrapping doesn't break words inbetween
set nowrap                " default: no wrapping
set wildmenu              " tab completion for help
set wildmode=longest,list " make commanline completion work like bash


" TEXT EDITING
set nojoinspaces " Don't add a second space after a dot on reformatting
set ai           " set auto-indenting on for programming
set tabstop=2    " Uses 4 colums (spaces) for a tab
set shiftwidth=2 "
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
let g:gutentags_ctags_tagfile=".tags"





let mapleader = "\<SPACE>"

" switch to last buffer.
noremap ,b :b#<CR>


" Using the arrow-keys in the command-line navigates the command-history
" filtered by the input text, CTRL-P does the same without filtering. Since I
" don't want no arrow key-usage, make CTRL-P use the filtering too.
cnoremap <C-p> <Up>

" Removes quickfix buffer from showing up using :bnext and the like.
autocmd FileType qf set nobuflisted

" Defaults like <leader>h is mapped to left window already
let g:gitgutter_map_keys = 0
nmap gp <Plug>GitGutterPreviewHunk
nmap ga <Plug>GitGutterStageHunk
nmap gu <Plug>GitGutterUndoHunk
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk

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

let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0  " show summary of git changes like: '+16 ~32 -6'
let g:airline#extensions#wordcount#enabled = 0 " no need for wordcount. Not in school any more.

let g:airline#extensions#whitespace#trailing_format = '·%s'
" let g:airline#extensions#whitespace#mixed_indent_format = '%s▸'
let g:airline#extensions#whitespace#mixed_indent_file_format = '▸%s'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0 " for example: 'tab 1/2' in top left
let g:airline#extensions#tabline#show_splits = 0 " show names of splits at the right
let g:airline#extensions#tabline#show_buffers = 0 " Show buffers if no tabs available
let g:airline#extensions#tabline#show_tab_nr = 0 " don't show number of splits on tab
let g:airline#extensions#tabline#show_tab_type = 0 " only show tabs, so don't print 'tabs'/'buffers'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='solarized'
set laststatus=2    " always show, not just with when the view is split

let g:airline#extensions#tabline#tabtitle_formatter = 'AirlineTablineCurrentBuffer'
" copied from docs. This used to be the default?
function AirlineTablineCurrentBuffer(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnr = buflist[winnr - 1]
  let winid = win_getid(winnr, a:n)
  let title = bufname(bufnr)

  if empty(title)
    if getqflist({'qfbufnr' : 0}).qfbufnr == bufnr
      let title = '[Quickfix List]'
    elseif winid && getloclist(winid, {'qfbufnr' : 0}).qfbufnr == bufnr
      let title = '[Location List]'
    else
      let title = '[No Name]'
    endif
  endif

  return title
endfunction


" Displays the current mode, but shorter than the default
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }


"}}}
" NAVIGATION {{{1
"----------------------------------------
map <leader>s <Plug>(easymotion-s)
map <leader>f <Plug>(easymotion-f)
map <leader>F <Plug>(easymotion-F)

noremap <leader>t :FZF<CR>
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

inoremap <S-Tab> <C-d>

" navigation those anoying wrapped lines like a human
nmap j gj
nmap k gk


"}}}
" CODING {{{1
"----------------------------------------

" Used by Neovim's plugins

let g:python3_host_prog = substitute(system('which python3.6'), '\n', '', 'g')

if g:python3_host_prog == ""
  let g:python3_host_prog = substitute(system('which python3'), '\n', '', 'g')
endif
if g:python3_host_prog == ""
  let g:python3_host_prog = '/usr/bin/python3'
endif


let g:UltiSnipsExpandTrigger = "<c-l>"

autocmd FileType kotlin set tabstop=4
autocmd FileType kotlin set shiftwidth=4

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
autocmd BufNewFile,BufRead *.swift set filetype=swift
let g:syntastic_go_checkers = ['go']

" see: https://github.com/vim-ruby/vim-ruby/blob/master/doc/ft-ruby-omni.txt
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1

autocmd BufReadCmd *.jar,*.xpi,*.aar call zip#Browse(expand("<amatch>"))

" Linting
"----------------------------------------

autocmd! BufWritePost * Neomake
let g:neomake_java_enabled_makers = ['gradle']

let g:syntastic_go_checkers = ['go']


" Completion
"----------------------------------------

let g:deoplete#enable_at_startup = 1

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-d>"

" Use tern_for_vim for javascript completion
" let g:tern#command = ["tern"]
" let g:tern#arguments = ["--persistent"]


" REFACTORING {{{1
"----------------------------------------

" Easy search-and-replace
"----------------------------------------
" Takes the current word under the cursor and opens the command-line window
" with the '%s/old/new/gc' command filled in. Insert mode is available in this
" window for easy editing (see :help c_CTRL-F).
" If used in visual mode, you can search for multiple words or parts of words.
" vnoremap <expr> ,t SubSelection()
" nnoremap <expr> ,t SubWord()

vnoremap <expr> ,r ReplaceCurrentSelection()
nnoremap <expr> ,r ReplaceCurrentWord()

" runs in all windows
vnoremap <expr> ,R ReplaceCurrentSelection("windo")
nnoremap <expr> ,R ReplaceCurrentWord("windo")

" runs in all Buffers
vnoremap <expr> ,<C-r> ReplaceCurrentSelection("bufdo")
nnoremap <expr> ,<C-r> ReplaceCurrentWord("bufdo")


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
        let searchCmd = "vimgrep /\\<" . g:wordUnderCursor . "\\>/j **/*"
        let ext = expand('%:e')
        if ext != ""
          let searchCmd = searchCmd . '.' . ext
        endif
    endif

    echomsg searchCmd
    execute searchCmd
    cw

    let &grepprg = oldgrepprg
    let &grepformat = orig_grepformat
endfu

" WRITING {{{1
"===============================================================================

" set formatprg=par\ w78
set formatprg=~/repos/other/parkdown/parkdown.sh\ -w78

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
" FUNCTIONS {{{1
"===============================================================================

source ~/.vim/funcs.vim


" EXPERIMENTAL {{{1
"===============================================================================


" Switch between test and implementation {{{2
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


" run tests for different file types {{{2

autocmd FileType groovy map <Leader>ul :Dispatch ./gradlew test --console plain<CR>
"repeats last Dispatch command
autocmd FileType sh map <Leader>ul :Dispatch<Up><CR> 
autocmd FileType sh map <Leader>uc :Dispatch ./runTests.sh %<CR>
autocmd FileType sh map <Leader>ua :Dispatch ./runTests.sh<CR>

"}}}

" convert pdf file to vim-readable text using the 'pdftotext' command line tool
" :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk -layout <q-args> -


"----------------------------------------------------------------
" vim:fdm=marker
