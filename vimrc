" VIMRC


" _PLUGINS
" _SETTINGS
" _MAPPINGS
" _COMMANDS
" _PLUGIN SPECIFIC
"       __YOUCOMPLETEME
"       __AIRLINE
"       __COMMAND_T
"       __NERDTREE
"       __EASYMOTION
"       __NERDCommenter
"       __JAVACOMPLETE
"       __ULTISNIPS
"       __VIM_GRAND
"       __VIM_JAVA_HI_SEMANTICS
"       __VIM_OPEN_URL
"       __VIM_COMMENTARY
" _EXPERIMENTAL


" _PLUGINS
"===============================================================================

set nocompatible                  " be iMproved, required by Vundle
filetype off                      " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ENVIRONMENT
Plugin 'gmarik/Vundle.vim' " required. Plugin management using Vundle
Plugin 'sjl/vitality.vim'  " Improvements for tmux (autofocus event + cursor)
Plugin 'L9'                " Common library. Is it used?


Plugin 'scrooloose/nerdtree'     " Easy filesystem navigation
Plugin 'wincent/command-t'       " Quickly open cwd files by name
Plugin 'Lokaltog/vim-easymotion' " Direcly moving the cursor somewhere
Plugin 'rhysd/vim-grammarous'    " Plugin for grammar checking

" ENHANCEMENTS
Plugin 'tpope/vim-unimpaired'             " essential: group mappings to [ and ] for common functions
Plugin 'tpope/vim-surround'               " Essential: Surrounding text with (), {}, [] and more
Plugin 'tpope/vim-fugitive'               " Git intergration
Plugin 'tpope/vim-scriptease'             " vim plugin writing improvements
Plugin 'tpope/vim-speeddating'            " CTRL-X and CTRL-A enhancements for dates etc
Plugin 'godlygeek/tabular'                " Easy table creation
Plugin 'tpope/vim-dispatch'               " Async task runner
Plugin 'stefandtw/quickfix-reflector.vim' " Allows modifying all searchresults in quickfix window
Plugin 'tpope/vim-vinegar'                " Netrw upgrader > REMOVE?
Plugin 'tpope/vim-eunuch'                 " Filesystem commands in vim like (:Rename or :Remove)
Plugin 'artnez/vim-wipeout'               " Removes empty buffers
Plugin 'tpope/vim-repeat'                 " Improves vim's dot command-repeating
Plugin 'henrik/vim-open-url'              " Improvements to open an url on the current line
Plugin 'moll/vim-bbye'                    " Close current buffer without closing split

" CODING
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-abolish'
Plugin 'meonlol/vim-rubytest'
" Plugin 'scrooloose/nerdcommenter' " Replaced by tpope/vim-commentary
" Plugin 'vim-scripts/JavaImp.vim--Lee' " Not used.

" STYLING & SYNTAX
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'bling/vim-airline'
Plugin 'tfnico/vim-gradle'

" MY STUFF
Plugin 'meonlol/vim-android'
Plugin 'meonlol/pyunit.vim'
Plugin 'meonlol/vim-grand'
Plugin 'meonlol/vim-java-hi-semantics'
Plugin 'meonlol/javacomplete'


" TRIED
" Maybe try again later
" Plugin 'dhruvasagar/vim-table-mode' " Interesting for makeing tables (exel
" Plugin 'Shougo/javacomplete'
" Plugin 'yegappan/greplace'          " Never used
" Plugin 'reinh/vim-makegreen'        " Do I even use this?


" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle




" _SETTINGS
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

set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" au FocusGained,BufEnter * :silent! e
" au FocusLost,WinLeave * :silent! w



" THEME
set background=dark
 let g:solarized_visibility = "high"
 let g:solarized_contrast = "high"
 "let g:solarized_termcolors= 256 "Guess I shouldn't use this one
let g:solarized_termtrans = 1
colorscheme solarized

set guifont=Menlo\ Regular:h12
set t_Co=256


let NERDTreeHijackNetrw=1




" _MAPPINGS
"===============================================================================

let mapleader = "\<SPACE>"

" Search highlighting toggle
" map  <F12> :set hls!<CR>
" imap <F12> <ESC>:set hls!<CR>a
" vmap <F12> <ESC>:set hls!<CR>gv

noremap <leader>n :NERDTreeToggle<CR>

noremap <leader>\| :Tabularize/\|<CR>
noremap <leader>on :noh<CR>

" switch to last buffer. Like this one best
" h
noremap ,b :b#<CR>
" delte current buffer without closing window
noremap _b :Bdelete<CR>

" for those anoying wrapping lines
nmap j gj
nmap k gk

" easyer window commands
map <leader>w <C-W>
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

" map [w i<space><ESC>l
" map ]w a<space><ESC>h

" QUICK SUBSTITUTE CWORD
" 1. saves word under cursor in g:replacingString
" 2. Opens cmdwin and goes to insert mode
" 3. inputs %s/\<string\>/string/gc (string is g:replacingString and \<\> specifies whole word only)
" 4. Visually selects the second string for easy replacing or changing
noremap <F6> :let g:replacingString = expand("<cword>")<CR> q:i%s/\<<c-r>=g:replacingString<cr>\>/<c-r>=g:replacingString<cr>/gc<ESC>2T/vet/

noremap <F7> :call VimGrepThis()<CR>
noremap <F8> :call GitGrepThis()<CR>

fu! VimGrepThis()
    let g:wordUnderCursor = expand("<cword>")
    let vimGrepCommand = "vimgrep /\\<" . g:wordUnderCursor . "\\>/j **/*." .  expand('%:e')
    echomsg vimGrepCommand
    execute vimGrepCommand
    cw
endfu

fu! GitGrepThis()
    let g:wordUnderCursor = expand("<cword>")
    let gitGrepCommand = "Ggrep " . g:wordUnderCursor
    echomsg gitGrepCommand
    execute gitGrepCommand
    cw
endfu



" _COMMANDS
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
command! Ltags helptags ~/Dropbox/leon/notes/ | helptags ~/Dropbox/leon/todo/
command! Lnotes e ~/Dropbox/leon/notes/index.txt
command! Ltodo e ~/Dropbox/leon/todo/reusable_todo_home.txt
command! Lochtend e ~/Dropbox/leon/todo/ochtend-ritueel.txt
command! Lvimrc e ~/.vim/vimrc

command! Ltwenty read !~/Dropbox/leon/developing/python/major_numbers/twenty.py
command! Ltwenty2 read ~/.twenty_last
command! Last Dispatch last -1 reboot


" _PLUGIN SPECIFIC
"===============================================================================

" __YOUCOMPLETEME
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

" __AIRLINE
"----------------------------------------
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
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


" __COMMAND_T
"----------------------------------------
map <D-O> :CommandT<CR>
map <leader>t :CommandT<CR>
map <leader>d :CommandT ~/Dropbox/leon/<CR>
set wildignore=**/build/*,**/.git/*,*.class

" __NERDTREE
"----------------------------------------
let NERDTreeWinSize = 50
let NERDTreeBookmarksSort = 0

" __EASYMOTION
"----------------------------------------
map <leader>s <Plug>(easymotion-s)
map <leader>f <Plug>(easymotion-f)
map <leader>F <Plug>(easymotion-F)

" __NERDCommenter
"----------------------------------------
" map <leader>/ <plug>NERDCommenterToggle

" __JAVACOMPLETE
"----------------------------------------


" __ULTISNIPS
"----------------------------------------
let g:UltiSnipsExpandTrigger = "<c-l>"


" __VIM_GRAND
"----------------------------------------
autocmd FileType java let b:dispatch = 'gradle'

" Use vim-dispatch to run gradleTest
autocmd FileType java nnoremap <leader>u :w<bar>Dispatch ./gradlew test -q<CR>
" This runs my android gradle test for this class only
autocmd FileType java nnoremap <leader>uc :w<bar>Dispatch ./gradlew testDebug -q -DtestDebug.single=%:t:r<CR>

" Run GrandCtags command every time you save a java file
autocmd BufWritePost *.java silent! GrandTags


" __VIM_JAVA_HI_SEMANTICS
"----------------------------------------
autocmd BufRead,BufNewFile *.java       setlocal syntax=java2
autocmd BufWritePost *.java     silent! setlocal syntax=java2
" autocmd BufWritePost *.java        silent! setlocal syntax=java2 | exe "normal! g`\""
" autocmd BufWritePost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`^" | endif
" autocmd BufWritePost *  silent!    exe "normal! g`^"

" __VIM_OPEN_URL
"----------------------------------------
noremap gx :OpenURL<CR>


" __VIM_COMMENTARY
"----------------------------------------
autocmd FileType groovy set commentstring=//%s
" autocmd FileType groovy let b:commentary_format="//%s"


" _EXPERIMENTAL
"===============================================================================


" Use CTRL-P for command-history, using entered text to match.
cnoremap <C-p> <Up>

" For JavaImp
" let g:JavaImpPaths = "./src/main/java/,./src/test/java/"

" TODO: Fix?
" Removes quickfix buffer from showing up using :bnext and the like.
autocmd FileType qf set nobuflisted

" Doesn't work with noremap for some reason
autocmd FileType ruby map <Leader>ut <Plug>RubyTestRun
autocmd FileType ruby map <Leader>uc <Plug>RubyFileRun
autocmd FileType ruby map <Leader>ul <Plug>RubyTestRunLast

autocmd FileType java noremap <Leader>i :GrandInstall<CR>

nnoremap ,t :call OpenOther()<CR>



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
