
" VIMRC


" VUNDLE SETUP
"===============================================================================

set nocompatible                  " be iMproved, required by Vundle
filetype off                      " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ENVIRONMENT
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'sjl/vitality.vim'  " Improvements for tmux (autofocus event + cursor)
Plugin 'L9'

Plugin 'scrooloose/nerdtree'
Plugin 'wincent/command-t'
Plugin 'Lokaltog/vim-easymotion'

" ENHANCEMENTS
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch' "Async task runner
Plugin 'stefandtw/quickfix-reflector.vim'
Plugin 'tpope/vim-vinegar' "Netrw upgrader
Plugin 'tpope/vim-eunuch' "Commands like :Rename
Plugin 'artnez/vim-wipeout'
Plugin 'tpope/vim-repeat' "Extends vim's repeating using '.'
Plugin 'henrik/vim-open-url'

" CODING
Plugin 'Shougo/javacomplete'
Plugin 'vim-scripts/JavaImp.vim--Lee'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter' " Why not try tpopes version? Tpope = generally more my style
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-abolish'

" STYLING & SYNTAX
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'bling/vim-airline'
Plugin 'tfnico/vim-gradle'

"Plugin 'henrik/vim-qargs'    " Do I even use this?
"Plugin 'reinh/vim-makegreen' " Do I even use this?
"Plugin 'moll/vim-bbye'       " Do I even use this?

"MY STUFF
Plugin 'meonlol/vim-android'
Plugin 'meonlol/pyunit.vim'
Plugin 'meonlol/vim-grand'
Plugin 'meonlol/vim-java-hi-semantics'


" TRIED
" Maybe try again later
"Plugin 'dhruvasagar/vim-table-mode' " Interesting for makeing tables (exel
"Plugin 'jewes/Conque-Shell'         " Interesting shell intergration. Never used it
"Plugin 'vim-scripts/javacomplete'
"Plugin 'PeterCxy/javacomplete'
"Plugin 'yegappan/greplace'          " Never used


" All of your Plugins must be added before the following line
call vundle#end()			 " required by Vundle
filetype plugin indent on	 " required by Vundle




" SETTINGS
"===============================================================================


"ENVIRONMENT
set nocompatible	" use vim defaults
set nobackup		" do not keep a backup file
set noswapfile		" don't want no swapfiles eather. Might disable if ever it causes problems for me. I'm a compulsive saver anyway.
set visualbell t_vb=	" turn off error beep/flash
set visualbell	" turn off visual bell
set hidden	" allow swapping to other buffer when unwritten

set backspace=indent,eol,start " make that backspace key work the way it should (only in terminal)
set mouse=a			" Scroling using the mouse if I have my hands there accidentally
set relativenumber	" Easier moving stuff around.

set hlsearch		" highlight searches. Pratical with * search (see mapleaders)

"UI
set scrolloff=3		" keep 3 lines when scrolling
set number			" show line numbers
set ruler			" show the current row and column
set showcmd			" display incomplete commands
set lbr				" wrapping doesn't break words inbetween
set nowrap			" default: no wrapping
set wildmenu		" tab completion for help


"TEXT EDITING
set ai				" set auto-indenting on for programming
set tabstop=4		" Uses 4 colums (spaces) for a tab
set shiftwidth=4	" 
set noexpandtab		" use tabs in stead of spaces
" TRICK: use 'set et|retab' to convert all tabs to spaces or 'set noet|retab!' for the reverse

"SEARCHING
set incsearch		" do incremental searching
set ignorecase		" ignore case when searching
set smartcase		" no ignorecase if Uppercase char present

"FILES
syntax on		" turn syntax highlighting on by default
filetype on		" detect type of file
filetype indent on	" load indent file for specific file type
filetype plugin on  " ?
set autoread
set autowrite

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! w



"THEME
set background=dark
 let g:solarized_visibility = "high"
 let g:solarized_contrast = "high"
 "let g:solarized_termcolors= 256 "Guess I shouldn't use this one
let g:solarized_termtrans = 1
colorscheme solarized

set guifont=Menlo\ Regular:h12
set t_Co=256


let NERDTreeHijackNetrw=1




" MAPPINGS
"===============================================================================

let mapleader = "\<SPACE>"

"Search highlighting toggle
"map  <F12> :set hls!<CR>
"imap <F12> <ESC>:set hls!<CR>a
"vmap <F12> <ESC>:set hls!<CR>gv

noremap <leader>n :NERDTreeToggle<CR>

noremap <leader>\| :Tabularize/\|<CR>

"switch to last buffer. Like this one best
noremap ,b :b#<CR>
"delte current buffer without closing window
noremap _b :Bdelete<CR>

" for those anoying wrapping lines
nmap j gj
nmap k gk

"easyer window commands
map <leader>w <C-W>
map <leader>h <C-W>h
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l

map [w i<space><ESC>l
map ]w a<space><ESC>h

"QUICK SUBSTITUTE CWORD
"1. saves word under cursor in g:replacingString
"2. Opens cmdwin and goes to insert mode
"3. inputs %s/\<string\>/string/gc (string is g:replacingString and \<\> specifies whole word only)
"4. Visually selects the second string for easy replacing or changing
noremap <F6> :let g:replacingString = expand("<cword>")<CR> q:i%s/\<<c-r>=g:replacingString<cr>\>/<c-r>=g:replacingString<cr>/gc<ESC>2T/vet/

"QUICK VIMGREP CWORD
"1. saves word under cursor in g:searchString
"2. executs vimgrep command for all java files in cwd (not jumping to first match) (whole word only)
"3. opens quickfix window (now use the 'stefandtw/quickfix-reflector.vim' plugin to use QUICK SUBSTITUTE CWORD in the quickfix window)
noremap <F7> :let g:searchString = expand("<cword>")<CR> :vim /\<<C-R>=g:searchString<CR>\>/j **/*.java **/*.xml<CR> :cw<CR>





" COMMANDS
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


" PLUGIN SPECIFIC
"===============================================================================

" YOUCOMPLETEME
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

" AIRLINE
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


" COMMAND-T
"----------------------------------------
map <D-O> :CommandT<CR>
map <leader>t :CommandT<CR>
map <leader>d :CommandT ~/Dropbox/leon/<CR>
set wildignore=**/build/*,**/.git/*,*.class

" NERDTREE
"----------------------------------------
let NERDTreeWinSize = 50
let NERDTreeBookmarksSort = 0

" EASYMOTION
"----------------------------------------
map <leader>s <Plug>(easymotion-s)
map <leader>f <Plug>(easymotion-f)
map <leader>F <Plug>(easymotion-F)

" NERDCommenter
"----------------------------------------
map <leader>/ <plug>NERDCommenterToggle

" JAVACOMPLETE
"----------------------------------------

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	autocmd Filetype java setlocal omnifunc=javacomplete#Complete
endif 
let g:exclude_tags = 1

" ULTISNIPS
"----------------------------------------
let g:UltiSnipsExpandTrigger = "<c-l>"


" MAKE GREEN
"----------------------------------------
"autocmd FileType python compiler pyunittest
"autocmd FileType python nnoremap <leader>u :MakeGreen discover<CR>


" VIM-GRAND
"----------------------------------------
autocmd FileType java let b:dispatch = 'gradle'

"Use vim-dispatch to run gradleTest
autocmd FileType java nnoremap <leader>u :w<bar>Dispatch ./gradlew test -q<CR>
"This runs my android gradle test for this class only
autocmd FileType java nnoremap <leader>uc :w<bar>Dispatch ./gradlew test -q -Dclasses=%:t:r<CR>

"Run GrandCtags command every time you save a java file
autocmd BufWritePost *.java silent! GrandTags


" VIM-JAVA-HI-SEMANTICS
"----------------------------------------
autocmd BufRead,BufNewFile *.java		setlocal syntax=java2
autocmd BufWritePost *.java		silent!	setlocal syntax=java2
"autocmd BufWritePost *.java		silent!	setlocal syntax=java2 | exe "normal! g`\""
"autocmd BufWritePost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`^" | endif
"autocmd BufWritePost *  silent!	exe "normal! g`^"

" VIM-OPEN-URL
"----------------------------------------
noremap gx :OpenURL<CR>




" EXPERIMENTAL
"===============================================================================

"For JavaImp
"let g:JavaImpPaths = "./src/main/java/,./src/test/java/" 



