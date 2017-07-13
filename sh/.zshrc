# ================ compinstall ========================================
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/bleblanc/.zshrc'

autoload -Uz compinit
compinit
# ================ compinstall ========================================


# ================ zsh-newuser-install ================================
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
setopt autocd
bindkey -e
# ================ zsh-newuser-install ================================


# ================ oh-my-zsh ==========================================
# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load, can also be "random"
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

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
# ================ oh-my-zsh ==========================================


# ================ common-files =======================================
source_exist() {
    [[ -f $1 ]] && source $1
}

source_exist $ZSH/oh-my-zsh.sh
source_exist $HOME/.promptline
source_exist $HOME/.bash_aliases
source_exist $HOME/.bash_nag
source_exist $HOME/.local/bin/aws_zsh_completer.sh
# ================ common-files =======================================


# ================ exports ============================================
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH="$PATH:$HOME/.rvm/bin"
# ================ exports ============================================
