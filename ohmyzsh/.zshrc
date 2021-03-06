# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mycustom"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  autoupdate
  alias-tips
  gitgo
  yarn-autocompletions
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-nvm
)
export NVM_AUTO_USE=true
# Auto Upgrage
DISABLE_UPDATE_PROMPT="true"

SPACESHIP_DIR_TRUNC_REPO=False

source $ZSH/oh-my-zsh.sh

if [ -e "/usr/local/bin/virtualenvwrapper_lazy.sh" ]; then
    source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

# Aliases

# Git
alias shortlog='git log --date=short --pretty=format:"[ %C(bold blue)%h%Creset ] - %cd || <%Cgreen%an%Creset> %Cred->%Creset %s"'
alias gpr='git pull --rebase -v origin $(current_branch)'
alias gdf='git diff --color-words'
alias gitgraph="git log --all --pretty='format:%d %Cgreen%h%Creset %an - %s' --graph"
alias gtag='git tag --sort version:refname'
alias gsu='git submodule update'
alias gb='git branch -avv'
alias gprs='git push store $(current_branch)'

# Common
alias rede="ifconfig en1 | grep inet | grep -v inet6 | awk -F' ' '{print \$2}'"
alias la="ls -lah"
alias descompacta='unrar e'
alias folderSize='du -sh'
alias psaux='ps aux | grep -v grep | grep'

export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
