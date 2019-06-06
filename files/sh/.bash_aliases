#======================================================================
# User Defined Shell Aliases
#
# Defined in a separate file to allow loading from bash and zsh
#======================================================================
export VISUAL='vim'
export EDITOR=$VISUAL

if $(ls --color=auto &>/dev/null); then
  alias ls='ls --color=auto'
else
  # Fucking mac bash...
  alias ls='ls -G'
fi

alias ll='ls -l'
alias la='ls -la'
alias l='ls -lah'
alias cdd='cd $HOME/Downloads'
alias cdg='cd $HOME/git'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias gp='git pull'
alias damn='git status'
alias dman='damn'
alias damnit='git add .'
alias commit='git commit'
alias shit='git push -u'
alias emac='emacsclient -c'
alias _='sudo'

#======================================================================
# NVM lazy load
#======================================================================
start_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

nvm() {
  unset -f nvm
  start_nvm
  nvm "$@"
}

node() {
  unset -f node
  start_nvm
  node "$@"
}

npm() {
  unset -f npm
  start_nvm
  npm "$@"
}

vim() {
  unset -f vim
  start_nvm
  vim "$@"
}

#======================================================================
# Compressed File Extraction
#======================================================================
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.tar.xz) tar xf $1;;
      *.bz2) bunzip2 $1;;
      *.rar) unrar x $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7za x $1;;
      *.rar) unrar $1;;
      *) echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#======================================================================
# Compatibility for shell to update env vars
#======================================================================
awscache() {
  eval `$HOME/repo/brians-stupid-scripts/awscache.py $@`
}

#======================================================================
# Fucking SSH usernames goddamn
#======================================================================
login() {
  ssh $@ || ssh -l bleblanc $@
}
