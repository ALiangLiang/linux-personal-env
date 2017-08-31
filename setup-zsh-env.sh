cd ~
which zsh && echo "Already install zsh." || (echo "Please install zsh first."; exit 0)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp linux-personal-env/.zshrc .zshrc
