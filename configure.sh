# tmux
if [ -f $HOME/.tmux.conf ] || [ -h $HOME/.tmux.conf ]; then
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
echo "ln -s $PWD/.tmux.conf $HOME/.tmux.conf ..."
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
echo "done..."

# zsh
if [ -f $HOME/.zshrc ] || [ -h $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi
echo "ln -s $PWD/.zshrc $HOME/.zshrc ..."
ln -s $PWD/.zshrc $HOME/.zshrc

if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
echo "done..."

# vim
if [ -f $HOME/.vimrc ] || [ -h $HOME/.vimrc ]; then
    mv $HOME/.vimrc $HOME/.vimrc.bak
fi
echo "ln -s $PWD/.vimrc $HOME/.vimrc ..."
ln -s $PWD/.vimrc $HOME/.vimrc
if [ ! -d $HOME/.vim/bundle ]; then
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
echo "done..."

