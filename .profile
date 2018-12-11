SHELL_SESSION_HISTORY=0
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Avoid duplicates
export HISTCONTROL=ignoreboth:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s globstar
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# After each command, append to the history file and reread it
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

export PATH="$HOME/.yarn/bin:$PATH"
export EDITOR="sublime -n -w"
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}
export PS1='\[`[ $? = 0 ] && X=2 || X=1; tput setaf $X`\]\e[31m\]\h\[`tput sgr0`\]\[\e[34m\]:$PWD\n\[\e[32m\]$(parse_git_branch)\$ \[\e[m\]'
# export PS1="\[\e[32m\]\$(parse_git_branch)\[\e[34m\]\h:\W \$ \[\e[m\]"

export ANDROID_HOME=/Users/dennisbot/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

alias lu='history|cut -c 8-|sort|uniq|grep --color'
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=/Users/dennisbot/.dotfiles/ --work-tree=/Users/dennisbot'
