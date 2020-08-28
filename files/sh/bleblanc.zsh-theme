# Depends on the git plugin for work_in_progress()
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# RVM component of prompt
ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RUBY_PROMPT_SUFFIX="]%{$reset_color%}"

# Clock
ZSH_THEME_CLOCK_PROMPT_PREFIX="%{$fg[white]%}["
ZSH_THEME_CLOCK_PROMPT_SUFFIX="]%{$reset_color%}"

clock_prompt() {
  # echo "$ZSH_THEME_CLOCK_PROMPT_PREFIX%T$ZSH_THEME_CLOCK_PROMPT_SUFFIX"
  echo "$ZSH_THEME_CLOCK_PROMPT_PREFIX%D{%H:%M}$ZSH_THEME_CLOCK_PROMPT_SUFFIX"
}

# K8s context
ZSH_THEME_K8S_PROMPT_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_K8S_PROMPT_SUFFIX="]%{$reset_color%}"

k8s_context() {
  if type kubectl &> /dev/null; then
    context=$(kubectl config current-context)

    if [[ $context == arn:aws:eks:* ]]; then
      context=$(echo $context | cut -d/ -f 2)
    fi

    echo "$ZSH_THEME_K8S_PROMPT_PREFIX$context$ZSH_THEME_K8S_PROMPT_SUFFIX"
  fi
}

# Combine it all into a final right-side prompt
RPS1='$(git_custom_status)$(ruby_prompt_info)$(k8s_context)$(clock_prompt) $EPS1'

PROMPT='%{$fg[cyan]%}[$(shrink_path -f)% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B%(!.#.$)%b '
