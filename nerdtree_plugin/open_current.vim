" This script calls 'open' in osx or xdg-open under linux. This opens the
" selected folder in a filebrowser and everything else in it's default
" program.

"guard against sourcing the script twice
if exists("g:loaded_nerdtree_open_menuitem")
    finish
endif
let g:loaded_nerdtree_open_menuitem = 1

call NERDTreeAddMenuSeparator()
" Why doesn't this work for me?

call NERDTreeAddMenuItem({
    \ 'text': '(o)pen current node',
    \ 'shortcut': 'o',
    \ 'callback': 'NERDTreeOpenMenuItem' })


function! NERDTreeOpenMenuItem()
    let n = g:NERDTreeFileNode.GetSelected()
    let p = n.path.str({'escape': 1})

    if exepath('xdg-open') != ""
        call system("xdg-open " . p)
    elseif exepath('open') != ""
        call system("open " . p)
    else
        echo "no 'xdg-open' or 'open' available"
    endif
endfunction

