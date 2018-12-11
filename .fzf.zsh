# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dennisbot/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/dennisbot/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dennisbot/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/dennisbot/.fzf/shell/key-bindings.zsh"

