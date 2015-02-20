" This script calls osx's 'open' on the shell
" That will open folders in finder, images in the default image-viewer etc.

"guard against sourcing the script twice
if exists("g:loaded_nerdtree_open_osx_menuitem")
    finish
endif
let g:loaded_nerdtree_open_osx_menuitem = 1

"add a menu separator (a row of dashes) before our new menu item
call NERDTreeAddMenuSeparator()
" Why doesn't this work for me?

"add the main menu item
call NERDTreeAddMenuItem({
    \ 'text': '(o)pen current node',
    \ 'shortcut': 'o',
    \ 'callback': 'NERDTreeOpenOsxMenuItem' })

"call 'open [input]' on the shell
function! NERDTreeOpenOsxMenuItem()
    let n = g:NERDTreeFileNode.GetSelected()
    let p = n.path.str({'escape': 1})
    call system("open " . p)
endfunction

