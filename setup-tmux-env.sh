cd ~
which tmux && echo "Already install tmux." || sudo apt -y install  tmux

git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
echo "set -g mouse on" >> .tmux.conf.local
echo "setw -g automatic-rename on # rename window to reflect current program" >> .tmux.conf.local
echo "bind - split-window -v" >> .tmux.conf.local
echo "bind _ split-window -v" >> .tmux.conf.local
echo "bind | split-window -h" >> .tmux.conf.local
echo "bind > swap-pane -D       # swap current pane with the next one" >> .tmux.conf.local
echo "bind < swap-pane -U       # swap current pane with the previous one" >> .tmux.conf.local
echo "bind -r C-h previous-window # select previous window" >> .tmux.conf.local
echo "bind -r C-l next-window     # select next window" >> .tmux.conf.local

