
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" PLUGINS {{{1
"===============================================================================

set nocompatible                  " be iMproved, required by Vundle

filetype off                      " required by Vundle

call plug#begin('~/.vim/bundle')

" ENVIRONMENT {{{2
Plug 'junegunn/vim-plug' " Plugin management using vim-plug installed above, but this adds the docs
Plug 'sjl/vitality.vim'  " Improvements for tmux (autofocus event + cursor)

Plug 'scrooloose/nerdtree'      " Easy filesystem navigation
Plug 'Lokaltog/vim-easymotion'  " Direcly moving the cursor somewhere
" fzf is a system fuzzy finder. This also installs it.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" STYLING & SYNTAX {{{2
Plug 'vim-scripts/MultipleSearch'
Plug 'PeterRincker/vim-searchlight'
" Plug 'endel/vim-github-colorscheme'   " colorscheme based on githubs syntax highlighting
if has("nvim")
  Plug 'lifepillar/vim-solarized8'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sindrets/diffview.nvim'
else
  Plug 'altercation/vim-colors-solarized'
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

" CODING {{{2

" -- General {{{3
Plug 'tpope/vim-commentary'             " Comment stuff out.
Plug 'tpope/vim-abolish'                " quickly switch myCammelCase to MY_CAMMEL_CASE etc
Plug 'neomake/neomake'                  " Syntax linter (NeoVim)
Plug 'meonlol/vim-subvenient'           " TODO
Plug 'ludovicchabant/vim-gutentags'     " Tags handling
Plug 'vim-scripts/taglist.vim'          " tags overview window :TlistToggle
Plug 'editorconfig/editorconfig-vim'    " Support for reading config from .editorconfig file

" -- lanuage client {{{3
if has("nvim")

  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim' " auto-installer for language client languages
  Plug 'williamboman/mason-lspconfig.nvim'

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-vsnip'
  Plug 'quangnguyen30192/cmp-nvim-tags'
  Plug 'hrsh7th/vim-vsnip'

  set completeopt=menu,menuone,noselect
endif

" -- php {{{3

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
" 1. install rustup https://rustup.rs/
" 2. install language-server https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary
" 3. should work now


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
" filtered by the current input text, CTRL-P used to do the same but without
" filtering, but since configuring command-completion it now navigates through
" completion. Since I don't want to leave the home row for the arrows, and
" filtering using the current input is super handy, this maps CTRL j and k to
" the arrow keys.
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>


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
" nmap 0 g0 " g0 does not have the same function as 0 (jumps to different place)
" nmap E gE " this makes moving left and right weird.

set wildignore=**/build/*,**/.git/*,*.class

command! Lvimrc e ~/.vim/vimrc

" Styling {{{2
"----------------------------------------

set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:␣
set background=dark " can use 'yob' to switch to 'light'

let g:tex_flavor = 'latex'
let g:vimtex_compiler_method = "tectonic"
if has("nvim")
  set termguicolors
  colorscheme solarized8
else
  let g:solarized_visibility = "high"
  let g:solarized_contrast = "high"
  colorscheme solarized
  set t_Co=256
  " hi! MatchParen cterm=NONE,bold gui=NONE,bold ctermbg=12 guibg=#839496 ctermfg=15 guifg=#fdf6e3
endif

au TextYankPost * silent! lua vim.highlight.on_yank()

highlight Search guibg='Underlined' guifg='NONE'
highlight link Searchlight Incsearch

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
" Run FocusDispatch and then Dispatch
noremap <Leader>ul :Dispatch<CR>

fu! ReDispatch(args)
  let g:Dispatch=a:args " couldn't quickly figure out how to call FocusDispatch first
  :Dispatch
endfu

command! -nargs=* -complete=customlist,dispatch#command_complete ReDispatch :call ReDispatch(<q-args>)

" rerun Dispatch, but adding the provided arguments after the executable (at index 1)
function! EditDispatch()
  let [currentFocus, why] = dispatch#focus()
  " open cmd-line window and change to insert mode
  call feedkeys("q:i")
  " add command setting g:Dispatch with the previous command inserted, and then running Dispatch
  call feedkeys(substitute(currentFocus, ':Dispatch', ':ReDispatch', 'g'))
  " " exit insert mode, and go to the start of the replacement, ready for the user to change it
  call feedkeys("\<Esc>2T'W")
endfunction

command! EditDispatch :call EditDispatch()



" -- lanuage-client  {{{2
" function! ApplyLanguageClientMappings()
"   if has_key(g:LanguageClient_serverCommands, &filetype)
"     nnoremap <silent> ,d :call LanguageClient#textDocument_hover()<CR>
"     nnoremap <silent> ,i :call LanguageClient#textDocument_implementation()<CR>
"     nnoremap <silent> ,m : call LanguageClient_contextMenu()<CR>
"     nnoremap <silent> ,c : call LanguageClient#textDocument_codeAction()<CR>
"     nnoremap <silent> ,? : call LanguageClient#explainErrorAtPoint()<CR>
"     nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
"     nnoremap <silent> <leader>rr :call LanguageClient#textDocument_rename()<CR>
"   endif
" endfunction
" autocmd! FileType * call ApplyLanguageClientMappings() " so we call it on-load per filetype

if has("nvim")

lua <<EOF
require("sub-init")
EOF

" luafile 'lua/extended_config.lua'

endif


" -- gutentags {{{2
set tags+=.tags    " I want to use hidden tags files
let g:gutentags_ctags_tagfile=".tags"

let g:gutentags_file_list_command = {
   \ 'markers': {
       \ 'bashbuilder': 'git ls-files -- . ":!:old-*" ":!:bashbuilder"; ./bashbuilder listDeps',
       \ },
   \ }

" for bashbuilder stuff, add a '.gutctags' file this content:
" --language-force=sh
" --exclude=bashbuilder
" --exclude=old-*

" -- neomake {{{2
autocmd! BufWritePost * Neomake
let g:neomake_java_enabled_makers = ['gradle']

" -- ultisnips {{{2
let g:UltiSnipsExpandTrigger = "<c-l>"

" -- GitGutter {{{2
" Defaults like <leader>h I have mapped to left window already
let g:gitgutter_map_keys = 0
" Make sure gitgutter looks like the linenumber column
nmap gp <Plug>(GitGutterPreviewHunk)
nmap ga <Plug>(GitGutterStageHunk)
nmap gx <Plug>(GitGutterUndoHunk)
nmap [g <Plug>(GitGutterPrevHunk)
nmap ]g <Plug>(GitGutterNextHunk)

" -- Airline {{{2
let g:airline#extensions#hunks#enabled = 0  " hide summary of git changes like: '+16 ~32 -6'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0 " for example: 'tab 1/2' in top left
let g:airline#extensions#tabline#show_buffers = 0 " Show buffers if no tabs available
let g:airline#extensions#tabline#show_tab_nr = 0 " don't show number of splits on tab (usually 1 or 2)
let g:airline_theme='solarized'

" -- EasyMotion {{{2
map <Leader> <Plug>(easymotion-prefix)
" map <leader>s <Plug>(easymotion-s)
" map <leader>f <Plug>(easymotion-f)
" map <leader>F <Plug>(easymotion-F)


" -- FZF {{{2

noremap <leader>t :call FilesOrGFiles()<CR>
noremap <leader>b :Buffers<CR>

" -- diffview {{{2
" aliases to make his faster
:command! -nargs=* Do DiffviewOpen <args>
:command! -nargs=* Dc DiffviewClose <args>
:command! -nargs=* Dh DiffviewFileHistory <args>

" LANGUAGE CONFIG {{{1
"===============================================================================


" -- php {{{2
augroup PhpactorMappings
  au!
  au FileType php nnoremap <silent> ,i :PhpactorGotoImplementations<CR>
  au FileType php nnoremap <silent> ,m :PhpactorContextMenu<CR>
  au FileType php nnoremap <silent> <C-]> :PhpactorGotoDefinition<CR>
augroup END
<

" let g:LanguageClient_serverCommands['php'] = ['rust-analyzer']
" have to try and fix, but could not run installer:
" - https://github.com/felixfbecker/php-language-server

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
  let line = indent . 'echo "' . name . ':' . var . '"'
  call append(currLine, line)
endfu

function! ApplyShellMappings()
  " set g:Dispatch with the command first, so we can rerun by calling :Dispatch without arguments
  " <c-r>=   call vimscript by using the '=' buffer in the command
  noremap <Leader>uc :ReDispatch ./runTests.sh -v <c-r>=expand("%")<cr><CR>
  noremap <Leader>ua :ReDispatch ./runTests.sh -v -a <c-r>=expand("%")<cr><CR>
  noremap <Leader>uf :ReDispatch ./runTests.sh -v -m <c-r>=expand("<cword>")<cr> <c-r>=expand("%")<cr><CR>
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


" -- Applescript {{{2
command! Asformat call AppleScriptFormat()
function! AppleScriptFormat()
    execute "%s/},/},\r\t/g | %s/alias/\r\t\t\talias/g | noh"
endfunction


" CODING {{{1
"----------------------------------------

" Mapping for quick calculations
" from http://vimcasts.org/episodes/simple-calculations-with-vims-expression-register/
" nnoremap Q 0yt=A<C-r>=<C-r>"<CR><Esc>
nnoremap Q 0yt=f=lC<C-r>=<C-r>"<CR><Esc>




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

augroup slog
    autocmd!

    autocmd BufRead,BufNewFile *.slog		set filetype=slog
    autocmd BufRead,BufNewFile *.log		set filetype=text
augroup END

fu! JiraCreate()
  read ~/.vim/templates/ticket.jira
  setf jira
endfu

command! JiraCreate call JiraCreate()

augroup filetypedetect
  au BufNewFile,BufRead *.jira			setf jira
augroup END

" from :h hex-editing
" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin,*.jks let &bin=1
  au BufReadPost *.bin,*.jks if &bin | %!xxd
  au BufReadPost *.bin,*.jks set ft=xxd | endif
  au BufWritePre *.bin,*.jks if &bin | %!xxd -r
  au BufWritePre *.bin,*.jks endif
  au BufWritePost *.bin,*.jks if &bin | %!xxd
  au BufWritePost *.bin,*.jks set nomod | endif
augroup END

nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>

" convert pdf file to vim-readable text using the 'pdftotext' command line tool
" :command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk -layout <q-args> -

"----------------------------------------------------------------
" vim:fdm=marker
