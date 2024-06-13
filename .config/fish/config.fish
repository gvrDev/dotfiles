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

fish_add_path ~/.local/bin
fish_add_path ~/scripts

set -gx XDG_CURRENT_DESKTOP Sway

alias l="eza -la --icons=always"
alias ls="eza -la --icons=always"
alias v="nvim ."
alias mkdir="mkdir -pv"

alias dcs="docker ps -aq | xargs docker stop | xargs docker rm"
alias dcc="docker image ls -q | xargs -I {} docker image rm -f {}"

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
