# git clone https://github.com/plantveryan/gnu-setup.git
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf

### install tmux plugins
if [ ! -d  ~/.tmux/plugins/tpm ]; then
  mkdir -p ~/.tmux/plugins/tpm;
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm/bin/install_plugins

### install vim plugins
if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle;
fi

git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

~/.vim/bundle/youcompleteme/install.sh

