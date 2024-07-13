if status is-interactive
    set -lx SHELL fish
    keychain --eval --agents ssh -q -Q github skey | source
    if not set -q TMUX
      tmux new -A -s homebase
    end

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
    enable_transience
end

set --universal nvm_default_version lts

fish_add_path ~/.local/bin
fish_add_path ~/scripts

alias l="eza -la --icons=always"
alias ls="eza -la --icons=always"
alias v="nvim ."
alias mkdir="mkdir -pv"
alias update="sudo zypper refresh && sudo zypper dup --allow-vendor-change && flatpak update && sudo flatpak repair && sudo snap refresh"

alias dcs="docker ps -aq | xargs docker stop | xargs docker rm"
alias dcc="docker image ls -q | xargs -I {} docker image rm -f {}"
alias dcu="docker-compose up"
