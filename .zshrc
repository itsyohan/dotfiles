export EDITOR="nvim"
export USER=$(whoami)

# PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"
export PATH=".git/safe/../../bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ZSH
# needs to be run before other things
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
export ZSH=~/.oh-my-zsh
export UPDATE_ZSH_DAYS=30
source $ZSH/oh-my-zsh.sh

# Aliases
alias vim=$EDITOR
alias zshrc="$EDITOR ~/.zshrc"
alias typora="open -a Typora"
alias rake="bundle exec rake"
alias rspec="bundle exec rspec"
alias downloads="open ~/Downloads"
alias tmuxconf="$EDITOR ~/.tmux.conf"
alias vimrc="$EDITOR ~/.vimrc"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias gvimrc="$EDITOR ~/.gvimrc"
alias redisstart='sudo launchctl start io.redis.redis-server'
alias redisstop='sudo launchctl stop io.redis.redis-server'
alias rabbitstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'
alias rabbitstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'
alias ag='ag --path-to-ignore ~/.ignore'

# PG
# start
# pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
#
# stop
# pg_ctl -D /usr/local/var/postgres stop -s -m fast
#
# status
# pg_ctl -D /usr/local/var/postgres status

export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load all startup scripts in ~/.zshinit dir
for file in $HOME/.zshinit/*.sh; do
  echo "loading $file"
  . "$file";
done
