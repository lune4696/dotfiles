# Created by newuser for 5.9

# ctrl + arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# doom emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# lsp
export PATH="/usr/local/bin:$PATH"

# rust
source $HOME/.cargo/env

export EDITOR=emacs
eval "$(direnv hook zsh)"

eval "$(starship init zsh)"
