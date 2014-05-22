# 
# Fish Spawn ZSH Theme - Modification of the Kiwi Theme
# 

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

LOCATION_PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[red]%}@%{$fg_bold[cyan]%}%m%{$fg_bold[red]%}:%{$fg_bold[cyan]%}%2~%"

PROMPT='%{$fg_bold[green]%}┌[%{$fg_bold[cyan]%}${time}%{$fg_bold[green]%}]-($LOCATION_PROMPT{$fg_bold[green]%})-$(git_prompt_info_no_status)$(battery_pct_prompt)
%{$fg_bold[green]%}└> % %{$reset_color%}'

# get the name of the branch without the status.
function git_prompt_info_no_status() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$reset_color%}%{$fg_bold[cyan]%}git%{$fg_bold[red]%}:%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[green]%}]-"
