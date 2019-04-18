# ================ compinstall ========================================
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/bleblanc/.zshrc'

autoload -Uz compinit
compinit
# ================ compinstall ========================================


# ================ zsh-newuser-install ================================
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -e
# ================ zsh-newuser-install ================================


# ================ oh-my-zsh ==========================================
# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load, can also be "random"
ZSH_THEME="brime"

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
plugins=(aws git shrink-path)
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
source_exist $HOME/.manifold/bin/.manifold_completion
# ================ common-files =======================================


# ================ exports ============================================
export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin:$HOME/.manifold/bin
source /etc/profile.d/rvm.sh
# ================ exports ============================================


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/bleblanc/git/bluespurs/p2p-yale-api/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/bleblanc/git/bluespurs/p2p-yale-api/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/bleblanc/git/bluespurs/p2p-yale-api/node_modules/tabtab/.completions/sls.zsh ]] && . /home/bleblanc/git/bluespurs/p2p-yale-api/node_modules/tabtab/.completions/sls.zsh
