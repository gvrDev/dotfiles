PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/scripts"
export PATH

eval "$(keychain --agents ssh -q -Q github skey)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

alias ~=cd 'cd ~'
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

export OPENAI_API_KEY=$(pass show api/key/openai)
export ANTHROPIC_API_KEY=$(pass show api/key/anthropic)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -z "$TMUX" ]; then
    tmux new -A -s homebase
fi

# bun completions
[ -s "/home/gui/.bun/_bun" ] && source "/home/gui/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
