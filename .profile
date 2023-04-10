SHELL_SESSION_HISTORY=0
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Avoid duplicates
export HISTCONTROL=ignoreboth:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s globstar
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# After each command, append to the history file and reread it
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# export EDITOR="sublime -n -w"
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# http://jafrog.com/2013/11/23/colors-in-terminal.html
# https://unix.stackexchange.com/questions/148/colorizing-your-terminal-and-shell-environment
# https://unix.stackexchange.com/questions/102727/bold-text-when-using-256-colors
# USER=$(whoami)
# HOST='\033[02;36m\]\h'; HOST=' '$HOST
# TIME='\033[01;31m\]\t \033[01;32m\]'
# LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
# BRANCH=" \033[00;33m\]$(parse_git_branch) \e[0m\n\$ "
# PS1=$TIME$USER$HOST$LOCATION$BRANCH

# BLUE='\[\e[38;5;39m\]'
# PALE_YELLOW='\[\e[38;5;229m\]'
# RESET='\[`tput sgr0`\]'
# GREEN='\[\e[38;5;76m\]'
# export PS1="\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]${PALE_YELLOW}\h${RESET}${BLUE}:$(pwd)\n\[\e[32m\]$(parse_git_branch)\$ \e[0m"
# export PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\e[31m\]\h\[`tput sgr0`\]\[\e[34m\]:$PWD\n\[\e[32m\]$(parse_git_branch)\$ \[\e[m\]'
# export PS1="\[\e[32m\]\$(parse_git_branch)\[\e[34m\]\h:\W \$ \[\e[m\]"


alias cls='clear'
alias lu='history|cut -c 8-|sort|uniq|grep --color'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=/Users/dennisbot/.dotfiles/ --work-tree=/Users/dennisbot'
alias cpwd='pwd | clip'
alias gr='cd "$(git rev-parse --show-toplevel)"'
alias getremoteb="cls && git branch -r | grep -v '\->' | xargs -p -I % bash -c 'git branch --track ${0#origin/} $0' %"
