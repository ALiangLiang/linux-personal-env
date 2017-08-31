cd ~
which vim && echo "Already install vim." || (echo "Doesn't has vim. Please install vim."; exit 0)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp linux-personal-env/.vimrc .vimrc
