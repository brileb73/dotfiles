# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/bleblanc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
unsetopt beep
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# Update path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation
export ZSH=/home/bleblanc/.oh-my-zsh

# Set name of the theme to load, can also be "random"
#ZSH_THEME="robbyrussell"
ZSH_THEME="gallois"

# Hyphen-insensitive completion. Case sensitive completion must be off.
# _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty. This makes
# repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Function for source'ing files if exist
source_exist() {
    [[ -f $1 ]] && source $1
}

# Set prompt from promptline script
source_exist $HOME/.promptline

# Grab bash aliases
source_exist $HOME/.bash_aliases

# SSH key login nagger
source_exist $HOME/.bash_nag

# Add RVM to PATH for scripting
#export PATH="$PATH:$HOME/.rvm/bin"

