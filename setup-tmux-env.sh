cd ~
which tmux && echo "Already install tmux." || sudo apt -y install  tmux
git clone https://github.com/ALiangLiang/.tmux
ln -s .tmux/.tmux.conf
cp linux-personal-env/.tmux.conf.local .tmux.conf.local
