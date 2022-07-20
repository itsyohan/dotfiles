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
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# FZF
# use ripgrep for searches
# --hidden: show hidden files
# --follow: follow symlink
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias vim=$EDITOR
alias gvim=neovide
alias zshrc="$EDITOR ~/.zshrc"
alias downloads="open ~/Downloads"
alias nvimrc="$EDITOR ~/.config/nvim/init.vim"
alias vimrc="$EDITOR ~/.config/nvim/init.vim"

# Load all startup scripts in ~/.zshinit dir
# for file in $HOME/.zshinit/*; do
#   . "$file";
# done

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# . /opt/homebrew/opt/asdf/libexec/asdf.sh
. $(brew --prefix asdf)/libexec/asdf.sh
