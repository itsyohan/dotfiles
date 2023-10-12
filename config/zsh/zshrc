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
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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
alias vimrc="$EDITOR ~/.config/nvim/lua/user"
alias nvimrc=vimrc
alias gt="git-town"

# Load all startup scripts in ~/.zshinit dir
# for file in $HOME/.zshinit/*; do
#   . "$file";
# done

# . /opt/homebrew/opt/asdf/libexec/asdf.sh
. $(brew --prefix asdf)/libexec/asdf.sh
