#======================================================================
# ~/.bashrc
#======================================================================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Original prompt
#PS1='[\u@\h \W]\$ '

# Source if file exists
source_exist() {
    [[ -f $1 ]] && source $1
}

# Aliases
source_exist $HOME/.bash_aliases

# SSH key login nagger
source_exist $HOME/.bash_nag

# Bash Prompt
function get_host() {
    local only_if_ssh="0"

    if [ ! $only_if_ssh -o -n "${SSH_CLIENT}" ]; then
        echo "@$PROMPT_MAGENTA\h"
    fi
}

function get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function __prompt_command() {
    local last_exit_code="$?"

    PROMPT_RESET="\e[00m"
    PROMPT_WHITE="\e[37m"
    PROMPT_RED="\e[31m"
    PROMPT_GREEN="\e[32m"
    PROMPT_CYAN="\e[36m"
    PROMPT_MAGENTA="\e[35m"
    PROMPT_YELLOW="\e[93m"

    PROMPT_USER="$PROMPT_YELLOW\u$PROMPT_RESET"
    PROMPT_HOST="$(get_host)$PROMPT_RESET"
    PROMPT_PWD="$PROMPT_CYAN\w$PROMPT_RESET"
    PROMPT_BRANCH="$PROMPT_GREEN$(get_git_branch)$PROMPT_RESET"
    if [ $last_exit_code != 0 ]; then
        PROMPT_EXIT="$PROMPT_WHITE[$PROMPT_RED$last_exit_code$PROMPT_WHITE]$PROMPT_RESET"
    else
        PROMPT_EXIT=""
    fi

    PROMPT_TOP="$PROMPT_WHITE┌─$PROMPT_RESET"
    PROMPT_BOTTOM="$PROMPT_WHITE└──╼ $PROMPT_RESET"

    PS1="$PROMPT_TOP[$PROMPT_USER$PROMPT_HOST: $PROMPT_PWD]$PROMPT_BRANCH $PROMPT_EXIT\n$PROMPT_BOTTOM"
}

PROMPT_COMMAND=__prompt_command

