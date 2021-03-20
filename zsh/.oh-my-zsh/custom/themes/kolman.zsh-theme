local ret_status="%(?:%{$fg[white]%}\$ :%{$fg[red]%}${?}\$ )"
PROMPT='%{$fg_bold[green]%}%n@%m%{$fg[white]%}:%{$fg_no_bold[blue]%}%2d%{$reset_color%} $(git_prompt_info)${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗]"
ZSH_THEME_GIT_PROMPT_CLEAN="]"

# Autocompletion prompt stays white
zle_highlight=( default:fg=white )
