bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[7~" beginning-of-line # Home rxvt
bindkey "\e[2~" overwrite-mode    # Ins
bindkey "\e[3~" delete-char       # Delete
bindkey "\e[4~" end-of-line       # End
bindkey "\e[8~" end-of-line       # End rxvt

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git encode64)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias c='clear'

# alias for CSCC
alias sc='ssh sc -t schedule $1'
alias duty='ssh csduty'

# ls alias
alias ll='ls -l'
alias la='ls -a'
alias l='ls -alh'

# tmux aliases
alias t='tmux att -d'

# git aliases
alias g='git'
alias gbr='git branch'
alias ga='git add'
alias gc='git commit'
alias gs='git status'
alias gp='git push'
alias gd='git diff'
alias gl='git log'
alias gck='git checkout'
alias gpl='git pull'
alias gm='git merge'
alias gmfo='git merge --ff-only'
alias gt='git tag'
alias grm='git rm'
alias gst='git stash'
alias grs='git reset'
alias gcl='git clone'
alias grb='git rebase'
alias gmv='git mv'

alias gll='git log --pretty=format:"%C(Yellow)%h%Creset%x09%C(cyan)%ad%Creset%x09%s" --author="\(ALiangLiang\)\|\(wlliou\)" --date=format:"%Y-%m-%d %H:%M:%S" --reverse'

# pull target branch and rebase to current branch
gplrb() {
  git pull origin $1:$1 --ff-only
  git rebase $1
}

# do above command and push
gplrbp() {
  gplrb $1
  git push
}

# docker-compose aliases
alias dc='docker-compose'

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=$PATH:/home/wlliou/.config/composer/vendor/bin
export PATH=$PATH:/home/wlliou/afl/afl-2.52b
export AFL_PATH=/home/wlliou/afl/afl-2.52b

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

stty stop undef
