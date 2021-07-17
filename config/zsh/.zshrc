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

export EDITOR="nvim"
export USER=$(whoami)
export PATH="/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=".git/safe/../../bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Kubernetes
complete -F __start_kubectl kb
source <(kubectl completion zsh)

# FZF
# use ripgrep for searches
# --hidden: show hidden files
# --follow: follow symlink
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias vim=$EDITOR
alias zshrc="$EDITOR ~/.zshrc"
alias downloads="open ~/Downloads"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias kb=kubectl

# Load all startup scripts in ~/.zshinit dir
for file in $HOME/.zshinit/*; do
  . "$file";
done
