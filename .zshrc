PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/scripts"
PATH="$PATH:${ASDF_DATA_DIR:-$HOME/.asdf}/shims"
export PATH

eval "$(keychain --eval --agents ssh -q -Q github skey)"

if [ -z "$TMUX" ]; then
    tmux new -A -s homebase
fi

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='ls -a'
alias ll='ls -la'

alias v="nvim ."
alias mkdir="mkdir -pv"
alias update="sudo pacman -Syu && flatpak update && flatpak repair"

alias dcs="docker ps -aq | xargs docker stop"
alias dcc="docker image ls -q | xargs -I {} docker image rm -f {}"
alias dcu="docker-compose up"

alias gfa="git fetch --all && git pull"

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
. "$HOME/.cargo/env"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
