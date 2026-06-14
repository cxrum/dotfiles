# Git-centric variation of the "fishy" theme.

function get_os_prompt() {
    if [ -f /etc/os-release ]; then
        local os_name=$(grep -E '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')
        echo "$os_name"
    else
        echo "arch"
    fi
}

function get_container_name() {
    if [ -n "$CONTAINER_ID" ]; then
        echo "-$CONTAINER_ID"
    elif [ -f /run/.containerenv ]; then
        echo "-unknown-box"
    fi
}

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

local user_color='blue'
test $UID -eq 0 && user_color='red'

PROMPT='%(?..%{$fg_bold[red]%}exit %?%{$reset_color%})
%{$fg[cyan]%}$(get_os_prompt)%{$reset_color%}$(get_container_name)'\
'%{$fg_bold[green]%}@%n%{$reset_color%}'\
'%{$fg[$user_color]%}%~%{$reset_color%}'\
'%(!.#.$) '

PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
