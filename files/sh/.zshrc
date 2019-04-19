# ================ compinstall ========================================
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 10
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# ================ compinstall ========================================


# ================ zsh-newuser-install ================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory extendedglob nomatch notify
unsetopt autocd beep
bindkey -e

export WORDCHARS="*?[]~=;!#$%^(){}<>"
# ================ zsh-newuser-install ================================


# ================ oh-my-zsh ==========================================
# Path to oh-my-zsh installation
export ZSH=/usr/share/oh-my-zsh

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

# plugins can be found in /usr/share/oh-my-zsh/plugins/*
# Custom plugins may be added to /usr/share/oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux git)
# ================ oh-my-zsh ==========================================


# ================ common-files =======================================
source_exist() {
    [[ -f $1 ]] && source $1
}

source_exist $ZSH/oh-my-zsh.sh
source_exist $HOME/.bash_aliases
source_exist $HOME/.bash_nag
source_exist /usr/share/nvm/init-nvm.sh
# ================ common-files =======================================


# ================ exports ============================================
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.gem/ruby/bin"
# ================ exports ============================================