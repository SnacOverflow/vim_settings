
" Toggle quickfix list {{{

function! GetBufferList()
    redir =>buflist
    silent! ls!
    redir END
    return buflist
endfunction

nnoremap <silent> <leader>wl :call ToggleList("Location List", 'l')<CR>
nnoremap <silent> <leader>we :call ToggleList("Quickfix List", 'c')<CR>
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


" [w ]w {{{1
" Move between tabs with [w ]w
" copied basic [] implementation from vim-unimpaired
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

" diff {{{1

" toggle diff mode in open split
nnoremap <leader>d :ToggleDiff<CR>
command! ToggleDiff call ToggleDiff()
fu! ToggleDiff()
  if &diff == "nodiff"
    :windo difft
  else
    :diffo!
  endif
endfu

noremap ,s :call ToggleWhiteSpace()<CR>
function! ToggleWhiteSpace()
  if &diffopt =~ 'iwhite'
    set diffopt-=iwhite
  else
    set diffopt+=iwhite
  endif
endfunction

noremap ,a :call CycleDiffAlgorithms()<CR>
function! CycleDiffAlgorithms()
    let algorithms = ["myers", "minimal", "patience", "histogram"] " from :h diffopt

    let diffOptMatch = matchlist(&diffopt, 'algorithm:\([a-z]*\)')
    if len(diffOptMatch) > 0
      let currentOptValue = diffOptMatch[0]
      let currentAlgorithmName = diffOptMatch[1]
      let nextAlgIndex = index(algorithms , currentAlgorithmName) + 1
      if nextAlgIndex >= len(algorithms)
        let nextAlgIndex = 0 " loop list
      endif
      let &diffopt = substitute(&diffopt, currentOptValue, "algorithm:" . algorithms[nextAlgIndex], "")
    else
      " same as: set diffopt+=algorithm:patience
      let &diffopt = &diffopt . ",algorithm:" . algorithms[1]
    endif
endfunction

" Custom Par {{{1

function! CustomPar(start, end)
  let lines = getline(a:start, a:end) 
  let lines = AddNewlineAfterSlash(lines)

  let formattedLines = systemlist("par", lines)
  let formattedLines = RemoveNewlineAfterSlash(formattedLines)
  call add(formattedLines, "")		" Last newline was removed before

  execute 'silent ' . a:start . "," . a:end . "delete" 
  call append(a:start -1, formattedLines)
endfunction

fu! AddNewlineAfterSlash(lines)
  let specialLines = GetLinesEndingInSlash(a:lines)
  for cIndex in reverse(specialLines)
    call insert(a:lines, "", cIndex+1)
  endfor
  return a:lines
endfu

fu! RemoveNewlineAfterSlash(lines)
  let specialLines = GetLinesEndingInSlash(a:lines)
  for cIndex in reverse(specialLines)
    call remove(a:lines, cIndex+1)
  endfor
  return a:lines
endfu

fu! GetLinesEndingInSlash(lines)
  let specialLines = []
	let index = 0
	while index < len(a:lines)
	   let item = a:lines[index]
     if item =~ "\\\\$"
       call add(specialLines, index)
     endif
	   let index = index + 1
	endwhile
  return specialLines
endfu


" Refactoring {{{1

fu! ReplaceCurrentWord(...)
  let l:currentWord = expand("<cword>")
  let l:searchString = "\\<" . EscapeForVimRegexp(l:currentWord) . "\\>" "add the word-boundries, as this searches for the selected word only
  call StageSearchAndReplaceInCommandWindow(l:searchString, l:currentWord, a:0 == 1 ? a:1 : "")
endfu

fu! ReplaceCurrentSelection(...)
  let l:selectedString = s:get_visual_selection()
  call StageSearchAndReplaceInCommandWindow(EscapeForVimRegexp(l:selectedString), l:selectedString, a:0 == 1 ? a:1 : "")
endfu

" write a search and replace as provided in the command window, ready for the user to change and run it
fu! StageSearchAndReplaceInCommandWindow(searchString, replacementString, target)
  " open cmd-line window and change to insert mode
  call feedkeys("q:i")
  " write typical search and replace string '%s/search/replace/gc'
  call feedkeys(a:target . "%s/" . a:searchString . "/" . a:replacementString . "/gc")
  " exit insert mode, and go to the start of the replacement, ready for the user to change it
  call feedkeys("\<Esc>2T/")
endfu

" credit: https://stackoverflow.com/a/61517520/3968618
function! EscapeForVimRegexp(str)
  return escape(a:str, '^$.*?/\[]')
endfunction
function! EscapeForGNURegexp(str)
  return escape(a:str, '^$.*?/\[]()' . '"' . "'")
endfunction

" credit: https://stackoverflow.com/a/6271254/3968618
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction


" }}}
" Runing Tests {{{1

fu! RunTestsInFile()
  let g:lastTestPath = expand("%")
  let g:lastTestFileType = &ft
  if g:lastTestFileType == 'vim'
    call s:echoRun(":UTRun " . g:lastTestPath)
    copen
  elseif g:lastTestFileType == 'sh'
    call s:echoRun(":ReDispatch ./runTests.sh -v " . g:lastTestPath)
  else
    echom "No test runner or RunTestsInFile() action configured for filetype: " . &ft
  endif
endfu

" runs last test OR calls Dispatch if :ReDispatch was used with some command
fu! RunLastTests()
  if !exists("g:lastTestPath") && !exists("g:Dispatch")
    echom "Error: No last test or :Dispatch to run."
  elseif exists("g:lastTestFileType") && g:lastTestFileType == 'vim'
    call s:echoRun(":UTRun " . g:lastTestPath)
    copen
  elseif exists("g:Dispatch")
    call s:echoRun(":Dispatch")
  else
    echom "No test runner or RunLastTests() action configured for filetype: " . g:lastTestFileType
  endif
endfu

fu! RunAllTests()
  let g:lastTestPath = expand("%")
  let g:lastTestFileType = &ft
  if &ft == 'vim'
    let g:lastTestPath = './test/**/*.vim'
    call s:echoRun(":UTRun " . g:lastTestPath)
    copen
  elseif g:lastTestFileType == 'sh'
    call s:echoRun(":ReDispatch ./runTests.sh -v -a " . g:lastTestPath)
  else
    echom "No test runner or RunAllTests() action configured for filetype: " . &ft
  endif
endfu

fu! RunCurrentTestFunction()
  let g:lastTestPath = expand("%")
  let g:lastTestFileType = &ft
  if g:lastTestFileType == 'sh'
    call s:echoRun(":ReDispatch ./runTests.sh -v -m " . expand("<cword>") . " " . g:lastTestPath)
  else
    echom "No test runner or RunCurrentTestFunction() action configured for filetype: " . &ft
  endif
endfu


fu s:echoRun(cmd)
  echom "Running " . a:cmd
  exe a:cmd
endfu

" }}}

fu! AssertSystemProgramAvailable(name)
  if substitute(system('which ' . a:name), '\n', '', 'g') == ""
    throw "The program '" . a:name . "' is required to run this function. Please install it first."
  endif
endfu

" Render the current markdown file to html using pandoc
"
" Will create a temp file that will be reused when running the command
" multiple times, so you can refresh the file in the browser you have open.
fu! MdRender()
  let srcFile = expand('%:p')

  " create a temp html file, and save it so we can update it
  if !exists('b:mdTmpOut')
    let l:mdTmpOut = tempname() . ".html"
  else
    let l:mdTmpOut = b:mdTmpOut
  endif

  call AssertSystemProgramAvailable('pandoc')
  call system('pandoc ' . srcFile . ' -o ' . l:mdTmpOut)

  if !exists('b:mdTmpOut')
    let b:mdTmpOut = l:mdTmpOut
    echo system('xdg-open ' . l:mdTmpOut)
    echo "Rendered html to " . l:mdTmpOut . " and opened it in the browser."
  else
    echo "Updated html in file " . l:mdTmpOut
  endif
endfu

command! MdRender call MdRender()

" copied from fzf.vim/.../vim.vim -> s:get_git_root
function! GetGitRoot()
  let dir = substitute(split(expand('%:p:h'), '[/\\]\.git\([/\\]\|$\)')[0], '^fugitive://', '', '')
  let root = systemlist('git -C ' . fzf#shellescape(dir) . ' rev-parse --show-toplevel')[0]
  return v:shell_error ? '' : (root)
endfunction

" The fzf.vim plugin has 2 commands :Files, which opens FZF with all files in
" the wd, and :GFiles which is like :Files but limited to files tracked in the
" git repo. I want a mapping that uses :GFiles in a git repo (excluding build
" results etc), but normal :Files everywere else.
fu! FilesOrGFiles()
  let root = GetGitRoot()
  if empty(root)
    call fzf#vim#files('')
  else
    call fzf#vim#gitfiles('')
  endif
endfu

" autocmd FileType markdown set formatexpr=CustomPar(v:lnum,v:lnum+v:count-1)

"----------------------------------------------------------------
" vim:fdm=marker
