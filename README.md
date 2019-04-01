
```
https://github.com/neovim/neovim/wiki/Installing-Neovim

git clone https://github.com/meonlol/vim_settings.git ~/.vim
cd ~/.vim
ln -s vimrc init.vim

rm -rf ~/.config/nvim/
ln -s ~/.vim ~/.config/nvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c PlugInstall
```
