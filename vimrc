
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" PLUGINS {{{1
"===============================================================================

set nocompatible                  " be iMproved, required by Vundle

filetype off                      " required by Vundle

call plug#begin('~/.vim/bundle')

" ENVIRONMENT {{{2
Plug 'gmarik/Vundle.vim' " required. Plugin management using Vundle
Plug 'sjl/vitality.vim'  " Improvements for tmux (autofocus event + cursor)

Plug 'scrooloose/nerdtree'      " Easy filesystem navigation
" Plug 'Lokaltog/vim-easymotion'  " Direcly moving the cursor somewhere
" fzf is a system fuzzy finder. This also installs it.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" STYLING & SYNTAX {{{2
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/MultipleSearch'
" Plug 'endel/vim-github-colorscheme'   " colorscheme based on githubs syntax highlighting
if has("nvim")
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

" OTHER ENHANCEMENTS {{{2
Plug 'tpope/vim-unimpaired'               " essential: group mappings to [ and ] for common functions
Plug 'tpope/vim-surround'                 " Essential: Surrounding text with (), {}, [] and more
Plug 'tpope/vim-fugitive'                 " Git intergration
Plug 'airblade/vim-gitgutter'             " Shows the file's git-status in a gutter
Plug 'tpope/vim-speeddating'              " CTRL-X and CTRL-A enhancements for dates etc
Plug 'godlygeek/tabular'                  " Easy table creation
Plug 'tpope/vim-dispatch'                 " Async task runner
Plug 'stefandtw/quickfix-reflector.vim'   " Allows modifying all searchresults in quickfix window
Plug 'tpope/vim-vinegar'                  " Netrw upgrader (contains '-' shortcut)
Plug 'tpope/vim-eunuch'                   " Filesystem commands in vim like (:Rename or :Remove)
Plug 'artnez/vim-wipeout'                 " Removes empty buffers with :Wipe
Plug 'tpope/vim-repeat'                   " Improves vim's dot command-repeating
Plug 'vim-voom/VOoM'                      " Shows an index for the current file
Plug 'sk1418/HowMuch'                     " Calculate slections
Plug 'jeffkreeftmeijer/vim-numbertoggle'  " toggle absolute and relative line numbers, respecting active buffer.
" Plug 'tpope/vim-dadbod'                 " Db access

" CODING {{{2

" -- General {{{3
Plug 'tpope/vim-commentary'             " Comment stuff out.
Plug 'tpope/vim-abolish'                " quickly switch myCammelCase to MY_CAMMEL_CASE etc
Plug 'neomake/neomake'                  " Syntax linter (NeoVim)
Plug 'meonlol/vim-subvenient'           " TODO
Plug 'ludovicchabant/vim-gutentags'     " Tags handling
Plug 'vim-scripts/taglist.vim'          " tags overview window :TlistToggle
Plug 'editorconfig/editorconfig-vim'    " Support for reading config from .editorconfig file
" Plugin 'scrooloose/syntastic'         " Better support from other plugin
" Plug 'SirVer/ultisnips'               " Snippet integration. rearly used. Requires python
if has("nvim")
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'Shougo/deoplete-lsp'

  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
endif


" -- Vimscript {{{3
Plug 'tpope/vim-scriptease'             " vim plugin writing improvements
Plug 'junegunn/vader.vim'               " Vimscript Testing library

" -- Kotlin {{{3
Plug 'udalov/kotlin-vim'

" -- Java {{{3
Plug 'udalov/javap-vim'                 " view bytecode of class files using javap
" Plug 'artur-shaik/vim-javacomplete2'

" -- Groovy {{{3
Plug 'tfnico/vim-gradle'                " grooy highlighting and gradle compiling
Plug 'vim-scripts/groovyindent-unix'    " indentation for groovy scripts

" -- Applescript {{{3
" Plug 'dearrrfish/vim-applescript'

" -- Swift {{{3
" Plug 'mitsuse/autocomplete-swift'

" -- Javascript {{{3
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }


" -- go {{{3
" neovim only plugins
" if has("nvim")
"   Plug 'fatih/vim-go'
"   Plug 'meonlol/vim-godebug'              " Debugger for go
" endif

" -- rust {{{3
" Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'


" -- latex {{{3
Plug 'lervag/vimtex'                      " for latex



" MY PLUGINS {{{2
" Plug 'meonlol/vim-java-hi-semantics'
" Plug 'meonlol/vim-gosem'
" Plug 'http://meonlol@192.168.178.23/meonlol/vim-logsearch.git'
" Plugin 'meonlol/vim-android'
" Plugin 'meonlol/vim-grand'
" Plugin 'meonlol/vim-android'
" Plugin 'meonlol/vim-grand'

" }}}

" All of your Plugins must be added before the following line
" call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle
call plug#end()


" GENERAL {{{1
"===============================================================================


" env {{{2
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


" Text Editing {{{2
set nojoinspaces " Don't add a second space after a dot on reformatting
set ai           " set auto-indenting on for programming
set tabstop=2    " Uses 4 colums (spaces) for a tab
set shiftwidth=2 "
set expandtab    " use spaces in stead of tabs
" set noexpandtab  " use tabs in stead of spaces
" TRICK: use 'set et|retab' to convert all tabs to spaces or 'set noet|retab!' for the reverse

" Removes quickfix buffer from showing up using :bnext and the like.
autocmd FileType qf set nobuflisted


" Searching {{{2
set incsearch       " do incremental searching
set ignorecase      " ignore case when searching
set smartcase       " no ignorecase if Uppercase char present

" Files {{{2
syntax on          " turn syntax highlighting on by default
filetype on        " detect type of file
filetype indent on " load indent file for specific file type
filetype plugin on " ?
set autoread
set autowrite

" Mappings {{{2

let mapleader = "\<SPACE>"

" switch to last buffer.
noremap ,b :b#<CR>

" Using the arrow-keys in the command-line navigates the command-history
" filtered by the input text, CTRL-P does the same without filtering. Since I
" don't want no arrow key-usage, make CTRL-P use the filtering too.
cnoremap <C-p> <Up>


" easyer window commands
noremap <leader>w <C-W>
noremap <leader>h <C-W>h
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>l <C-W>l

" move up/down/left/right
noremap <C-j> 3<C-e>
noremap <C-k> 3<C-y>
noremap <C-h> 10zh
noremap <C-l> 10zl

inoremap <S-Tab> <C-d>

" navigation those anoying wrapped lines like a human
nmap j gj
nmap k gk

set wildignore=**/build/*,**/.git/*,*.class

command! Lvimrc e ~/.vim/vimrc

" Styling {{{2
"----------------------------------------

set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
set background=dark

let g:tex_flavor = 'latex'
let g:vimtex_compiler_method = "tectonic"
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" let g:solarized_termcolors= 256 "Guess I shouldn't use this one
let g:solarized_termtrans = 1
colorscheme solarized


" set guifont=Menlo\ Regular:h12
set t_Co=256


"}}}
" PLUGIN CONFIG {{{1
"===============================================================================

" -- Nerdtree {{{2
let NERDTreeWinSize = 50
let NERDTreeBookmarksSort = 0
let NERDTreeShowLineNumbers=1
let NERDTreeHijackNetrw=1

noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>N :NERDTreeFind<CR>

" -- Dispatch {{{2
" Run dispatch without arguments, assuming last command was run with FocusDispatch
noremap <Leader>ul :Dispatch<CR>

" rerun Dispatch, but adding the provided arguments after the executable (at index 1)
function! AppendDispatch(args)
  " inject args at position 1
  let g:Dispatch=join(insert(split(g:Dispatch), a:args, 1))
  :Dispatch
endfunction
command! -nargs=* AppendDispatch :call AppendDispatch(<q-args>)  "let g:Dispatch=g:Dispatch . " " . <q-args>  | :Dispatch


" -- deoplete {{{2
if has("nvim")
  let g:deoplete#enable_at_startup = 1
  " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-d>"
  call deoplete#custom#option('smart_case', v:true)

  inoremap <silent><expr> <C-Space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()

endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


" -- LanguageClient  {{{2

function! ApplyLanguageClientMappings()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    nnoremap <silent> ,d :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> ,i :call LanguageClient#textDocument_implementation()<CR>
    nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <leader>rr :call LanguageClient#textDocument_rename()<CR>
  endif
endfunction
autocmd! FileType * call ApplyLanguageClientMappings() " so we call it on-load per filetype

" let g:LanguageClient_semanticHighlightMaps = {
"     \ 'rust': {
"     \     'function': 'Type'
"     \   }
"     \ }


" -- gutentags {{{2
set tags+=.tags    " I want to use hidden tags files
let g:gutentags_ctags_tagfile=".tags"

       " \ 'bb': 'git ls-files -- . ":!:old-*" ":!:bb"; ./bb listDeps',
       " \ 'bb': 'find ~/.bb/ -type f -executable',
let g:gutentags_file_list_command = {
   \ 'markers': {
       \ 'bashbuilder': 'git ls-files -- . ":!:old-*" ":!:bashbuilder"; ./bashbuilder listDeps',
       \ },
   \ }

" -- neomake {{{2
autocmd! BufWritePost * Neomake
let g:neomake_java_enabled_makers = ['gradle']

" -- ultisnips {{{2
let g:UltiSnipsExpandTrigger = "<c-l>"

" -- GitGutter {{{2
" Defaults like <leader>h I have mapped to left window already
let g:gitgutter_map_keys = 0
" Make sure gitgutter looks like the linenumber column
highlight! link SignColumn LineNr
" nmap gp <Plug>GitGutterPreviewHunk
" nmap ga <Plug>GitGutterStageHunk
" nmap gu <Plug>GitGutterUndoHunk
" nmap [c <Plug>GitGutterPrevHunk
" nmap ]c <Plug>GitGutterNextHunk

" -- Airline {{{2
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
function! AirlineTablineCurrentBuffer(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnr = buflist[winnr - 1]
  let winid = win_getid(winnr, a:n)
  let title = bufname(bufnr)

  if empty(title)
    let title = '[No Name]'
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

" -- EasyMotion {{{2
map <leader>s <Plug>(easymotion-s)
map <leader>f <Plug>(easymotion-f)
map <leader>F <Plug>(easymotion-F)


" -- FZF {{{2
noremap <leader>t :FZF<CR>

" LANGUAGE CONFIG {{{1
"===============================================================================



" -- bash {{{2
fu! AddLogStatement(logTarget)
  let currLine = line('.')
  let indent = repeat(" ", indent(currLine))
  if a:logTarget =~ '^\$'
    let name = '\' . a:logTarget
    let var = a:logTarget
  else
    let name = a:logTarget
    let var = '$' . a:logTarget
  endif
  let line = indent . 'echo "' . name . '=' . var . '"'
  call append(currLine, line)
endfu

function! ApplyShellMappings()
  " set g:Dispatch with the command first, so we can rerun by calling :Dispatch without arguments
  " <c-r>=   call vimscript by using the '=' buffer in the command
  noremap <Leader>uc :let g:Dispatch='./runTests.sh <c-r>=expand("%")<cr>' <bar> :Dispatch<CR>
  noremap <Leader>uf :let g:Dispatch='./runTests.sh -m <c-r>=expand("<cword>")<cr> <c-r>=expand("%")<cr>' <bar> :Dispatch<CR>
  noremap <Leader>ua :let g:Dispatch='./runTests.sh' <bar> :Dispatch<CR>
  nnoremap <Leader>pl :call AddLogStatement(@0)<CR>
  nnoremap <Leader>pc :call AddLogStatement(expand("<cword>"))<CR>
  " nnoremap ,p oecho "<c-r>0:'${<c-r>0}'"<ESC><CR>
endfunction
autocmd! FileType sh call ApplyShellMappings() " so we call it on-load per filetype


" -- vimscript {{{2
function! ApplyVimscriptMappings()
   nnoremap ,p oechomsg "<c-r>0:'" . <c-r>0 . "'"<ESC><CR>
endfunction
autocmd! FileType vim call ApplyVimscriptMappings()
autocmd! FileType vader call ApplyVimscriptMappings()

" -- rust {{{2
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
" with nvim-lspconfig
" lua require('lspconfig').rust_analyzer.setup{}
" autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" -- kotlin {{{2
autocmd FileType kotlin set tabstop=4
autocmd FileType kotlin set shiftwidth=4

" -- java {{{2
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd BufRead,BufNewFile *.java       setlocal syntax=java2
autocmd BufWritePost *.java     silent! setlocal syntax=java2

autocmd BufReadCmd *.jar,*.xpi,*.aar call zip#Browse(expand("<amatch>"))

" -- groovy {{{2
autocmd FileType groovy set commentstring=//%s
autocmd FileType groovy map <Leader>al :Dispatch ./gradlew test --console plain<CR>

" -- markdown {{{2
autocmd FileType markdown set commentstring=<!--%s-->

" -- go {{{2
" autocmd BufRead,BufNewFile *.go       setlocal syntax=vim-gosem
" autocmd BufWritePost *.go     silent! setlocal syntax=vim-gosem
" autocmd FileType go map <Leader>ul :GoTest!<CR>
" autocmd BufWritePre *.go silent! GoImports
" autocmd BufWritePost *.go silent! !gotags -R -f=".tags" .
" let g:syntastic_go_checkers = ['go']

" -- swift {{{2
autocmd BufNewFile,BufRead *.swift set filetype=swift

" -- python {{{2

let g:python3_host_prog = substitute(system('which python3.6'), '\n', '', 'g')

if g:python3_host_prog == ""
  let g:python3_host_prog = substitute(system('which python3'), '\n', '', 'g')
endif
if g:python3_host_prog == ""
  let g:python3_host_prog = '/usr/bin/python3'
endif


" -- ruby {{{2
" see: https://github.com/vim-ruby/vim-ruby/blob/master/doc/ft-ruby-omni.txt
" let g:rubycomplete_buffer_loading = 1
" let g:rubycomplete_classes_in_global = 1

" -- javascript {{{2
" let g:tern#command = ["tern"]
" let g:tern#arguments = ["--persistent"]

" -- Applescript {{{2
command! Asformat call AppleScriptFormat()
function! AppleScriptFormat()
    execute "%s/},/},\r\t/g | %s/alias/\r\t\t\talias/g | noh"
endfunction


" CODING {{{1
"----------------------------------------

" Mapping for quick calculations
" from http://vimcasts.org/episodes/simple-calculations-with-vims-expression-register/
nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>




" REFACTORING {{{1
"----------------------------------------

" Easy search-and-replace
"----------------------------------------
" Takes the current word under the cursor and opens the command-line window
" with the '%s/old/new/gc' command filled in. Insert mode is available in this
" window for easy editing (see :help c_CTRL-F).
" If used in visual mode, you can search for multiple words or parts of words.

nnoremap ,r :call ReplaceCurrentWord()<CR>
vnoremap ,r :call ReplaceCurrentSelection()<CR>

" runs in all windows
nnoremap ,R :call ReplaceCurrentWord("windo")<CR>
vnoremap ,R :call ReplaceCurrentSelection("windo")<CR>

" runs in all Buffers
nnoremap ,<C-r> :call ReplaceCurrentWord("bufdo")<CR>
vnoremap ,<C-r> :call ReplaceCurrentSelection("bufdo")<CR>

" multi-file search
"----------------------------------------
" The following commands simply search the word under the cursor, ether using
" one of the supported quick searches, or internal vimgrep as a fallback. The
" results are then simply displayed in the quickfix window.
" 
" When this command is combined this with the stefandtw/quickfix-reflector plugin,
" to allow editing the quickfix window and saving the results to the
" corresponding files, and using the above ReplaceCurrentWord() mappings
" to modify the search results, this becomes a powerfull refactoring tool.
nnoremap ,/ :call SeachWordInCwd()<CR>
vnoremap ,/ :call SeachSelectedWordInCwd()<CR>



" WRITING {{{1
"===============================================================================

if exists('~/repos/other/parkdown/parkdown.sh')
  set formatprg=~/repos/other/parkdown/parkdown.sh\ -w78
elseif substitute(system('which par'), '\n', '', 'g') != ""
  set formatprg=par\ w78
endif

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

  

" convert pdf file to vim-readable text using the 'pdftotext' command line tool
" :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk -layout <q-args> -


"----------------------------------------------------------------
" vim:fdm=marker
