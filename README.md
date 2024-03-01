First, install neovim
https://github.com/neovim/neovim/wiki/Installing-Neovim

```
rm -rf ~/.vim ~/.config/nvim/
git clone https://github.com/leonschreuder/vim_settings.git ~/.vim
ln -s ~/.vim/vimrc ~/.vim/init.vim
ln -s ~/.vim ~/.config/nvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c :PlugInstall
```
