
"guard against sourcing the script twice
if exists("g:loaded_nerdtree_view_image_menuitem")
    finish
endif
let g:loaded_nerdtree_view_image_menuitem = 1

"add a menu separator (a row of dashes) before our new menu item
call NERDTreeAddMenuSeparator({
    \ 'isActiveCallback': 'NERDTreeViewImageMenuitemEnabled'})

"add the main menu item
call NERDTreeAddMenuItem({
    \ 'text': '(o)pen with system editor',
    \ 'shortcut': 'o',
    \ 'isActiveCallback': 'NERDTreeViewImageMenuitemEnabled',
    \ 'callback': 'NERDTreeViewImageMenuItem' })

"we only want the menu item to be displayed if the current
"node is an image file
function! NERDTreeViewImageMenuitemEnabled()
    let p = g:NERDTreeFileNode.GetSelected().path
    return !p.isDirectory
	"&& \ p.str() =~ '\c\.\(jpeg\|jpg\|gif\|png\|bmp\|tiff\)$'
endfunction

"open the file the cursor is on in eog
function! NERDTreeViewImageMenuItem()
    let n = g:NERDTreeFileNode.GetSelected()
    let p = n.path.str({'escape': 1})
    call system("open " . p)
endfunction

