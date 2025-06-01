PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/go/bin"
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

alias c="clear"

alias l='ls -a'
alias ll='ls -la'

alias v="nvim ."
alias mkdir="mkdir -pv"
alias update="sudo pacman -Syu && flatpak update && flatpak repair"

alias dcs="docker ps -aq | xargs docker stop"
alias dcc="docker image ls -q | xargs -I {} docker image rm -f {}"
alias dc="docker-compose"

alias gfa="git fetch --all --prune"
alias gc="git commit"
alias gp="git pull"

function awscon {
    aws ssm start-session --profile $1 --region us-east-2 --target i-0fc1f597df1c2e738 --document-name AWS-StartPortForwardingSessionToRemoteHost --parameters '{"host":["slingui-production-cluster.cluster-cr16acmartkt.us-east-2.docdb.amazonaws.com"],"portNumber":["27017"], "localPortNumber":["27018"]}'
}

alias gfa="git fetch --all && git pull"

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
. "$HOME/.cargo/env"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# bun completions
[ -s "/home/gui/.bun/_bun" ] && source "/home/gui/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
