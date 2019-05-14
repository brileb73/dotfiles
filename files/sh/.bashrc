# Aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

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

    PROMPT_RESET="\[\033[0m\]"
    PROMPT_WHITE="\[\033[0;37m\]"
    PROMPT_RED="\[\033[0;31m\]"
    PROMPT_GREEN="\[\033[0;32m\]"
    PROMPT_CYAN="\[\033[0;36m\]"
    PROMPT_MAGENTA="\[\033[0;35m\]"
    PROMPT_YELLOW="\[\033[0;33m\]"
    
    PROMPT_USER="$PROMPT_YELLOW\u$PROMPT_RESET"
    PROMPT_HOST="$(get_host)$PROMPT_RESET"
    PROMPT_PWD="$PROMPT_CYAN\W$PROMPT_RESET"
    PROMPT_BRANCH="$PROMPT_GREEN$(get_git_branch)$PROMPT_RESET"
    if [ $last_exit_code != 0 ]; then
        PROMPT_EXIT=" $PROMPT_WHITE[$PROMPT_RED$last_exit_code$PROMPT_WHITE]$PROMPT_RESET "
    else
        PROMPT_EXIT=""
    fi

    PROMPT_TOP="$PROMPT_WHITE┌─$PROMPT_RESET"
    PROMPT_BOTTOM="$PROMPT_WHITE└──╼ $PROMPT_RESET"
    
    PS1="[$PROMPT_USER$PROMPT_HOST: $PROMPT_PWD]$PROMPT_BRANCH$PROMPT_EXIT$ "
}

PROMPT_COMMAND=__prompt_command

# Home Dir Paths
export MANPATH="$MANPATH:$HOME/.local/share/man"
export PATH="$PATH:$HOME/.local/bin"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/brian.leblanc/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/brian.leblanc/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/brian.leblanc/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/brian.leblanc/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/brian.leblanc/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /Users/brian.leblanc/.nvm/versions/node/v10.15.3/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
