# Depends on the git plugin for work_in_progress()

# Hostname if connected over ssh
prompt_hostname() {
  if [[ -z "$SSH_CLIENT" ]]; then
    prompt_host=""
  else
    prompt_host="%{$fg[yellow]%}$(hostname -s):%{$reset_color%}"
  fi

  echo "$prompt_host"
}

# Change key when root
prompt_usertype() {
  if [[ $UID != 0 ]]; then
    prompt_user="$"
  else
    prompt_user="#"
  fi

  echo "$prompt_user"
}

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
ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"

# Combine it all into a final right-side prompt
RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'

PROMPT='$(prompt_hostname)%{$fg[cyan]%}[$(shrink_path -f)% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$(prompt_usertype)%b '
