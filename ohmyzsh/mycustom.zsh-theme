PROMPT='%{${fg[cyan]}%}$(get_username) in $(get_pwd)$reset_color $(get_package_version)$(git_prompt_info)
%{${fg[red]}%}❯%{${reset_color}%} %{%}'

function get_username() {
    echo "%{$fg_bold[green]%}$(id -un)%{$reset_color%}"
}

function get_pwd() {
    echo "%{$fg_bold[green]%}${PWD/$HOME/~}%{$reset_color%}"
}

function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_package_version() {
   if [[ -f package.json ]]; then
     echo "📦 $(less package.json | grep version | cut -d '"' -f 4) "
   fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">"
ZSH_THEME_GIT_PROMPT_DIRTY="%{${fg[red]}%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{${fg[green]}%}"
