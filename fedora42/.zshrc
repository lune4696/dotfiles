# Created by newuser for 5.9

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# emacs
export PATH="$HOME/.emacs.d/bin:$PATH"


# lsp
export PATH="/usr/local/bin/:$PATH"

# kotlinc
export PATH="/usr/local/bin/kotlinc/bin/:$PATH"


# flatpak (user)
export FLATPAK_USER_DIR="$HOME/.local/share/flatpak-clean/"

# lsp: 手動インストールした lsp も /usr/loval/bin に配置
#export PATH="$HOME/Documents/lsp/bin:$PATH"

# starship
eval "$(starship init zsh)"
