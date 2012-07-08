# Based on the oh-my-zsh dpoggi theme
RED="[38;05;167m"
ORANGE="[38;05;179m"
YELLOW="[38;05;222m"
GREEN="[38;05;107m"
BLUE="[38;05;67m"
PURPLE="[38;05;96m"
R=$reset_color
G=git_prompt_info
if [ $UID -eq 0 ]; then N=$RED; else N=$GREEN; fi

# PROMPT="${N}%n${R}@%{$BLUE%}%m${R}:%{$ORANGE%}%~%{$G%}%{$RED%} %(!:#:$)${R} "
# PROMPT2="%{$RED%}%_ > ${R}"

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
# ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}•${R}"
# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}○${R}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})${R}"

PROMPT='%{$N%}%n%{$R%}@%{$BLUE%}%m%{$R%}:%{$ORANGE%}%~$($G) %{$RED%}%(!.#.$)%{$R%} '
PROMPT2='%{$RED%}%_ > %{$R%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$YELLOW%}("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GREEN%}•%{$R%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED%}○%{$R%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$YELLOW%})%{$R%}"
