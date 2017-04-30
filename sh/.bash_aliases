# User Defined Shell Aliases
#
# Defined in a separate file to allow loading for bash and zsh

export VISUAL='vim'
export EDITOR=$VISUAL
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias l='ls -lah'
alias get-ips='/home/bleblanc/repo/brians-stupid-scripts/get-ips.py'
alias cdd='cd ~/Downloads'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias gp='git pull'
alias damn='git status'
alias damnit='git add .'
alias commit='git commit'
alias shit='git push -u'
 
export NVM_DIR='/home/bleblanc/.nvm'
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Load the fkn thing
 
#aws() {
#  if [[ "$1" == "cloudformation" ]]; then
#    cfnwatcher ${@:2}
#  else
#    aws $@
#  fi
#}
 
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
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

