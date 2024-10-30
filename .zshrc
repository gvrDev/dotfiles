PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/scripts"
PATH="$PATH:$HOME/development/flutter/bin"
export PATH

# if [ -z "$TMUX" ]; then
#     tmux new -A -s homebase
# fi

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l="eza -la --icons=always"
alias ls="eza -la --icons=always"
alias v="nvim ."
alias mkdir="mkdir -pv"
alias update="sudo zypper refresh && sudo zypper dup --allow-vendor-change && flatpak update && sudo flatpak repair && sudo snap refresh"

alias dcs="docker ps -aq | xargs docker stop | xargs docker rm"
alias dcc="docker image ls -q | xargs -I {} docker image rm -f {}"
alias dcu="docker-compose up"

eval "$(keychain --eval --agents ssh -q -Q github skey)"

# export OPENAI_API_KEY=$(pass show api/key/openai)
# export ANTHROPIC_API_KEY=$(pass show api/key/anthropic)

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# bun completions
[ -s "/home/gui/.bun/_bun" ] && source "/home/gui/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

bindkey -v
